class PaymentsController < ApplicationController
  rescue_from Paypal::Exception::APIError, with: :paypal_api_error
  before_filter :authenticate_user!

  def show
    @payment = Payment.find_by_identifier(params[:id])
    redirect_to root_url unless @payment.present?
  end

  def create
    @payment = Payment.new(params[:payment])

    if params[:payment][:amount].to_i >= 60 and @payment.project.active?
      @payment.user = current_user
      @payment.save!
      redirect_to review_payment_path(@payment)
    else
      redirect_to root_url, notice: 'Error: Invalid amount or innactive project'
    end
  end

  def review
    @payment = Payment.find(params[:id])
  end

  def checkout
    @payment = Payment.find(params[:id])
    @payment.amount = 5

    if current_user.credit >= @payment.amount
      current_user.credit = current_user.credit - @payment.amount
      current_user.save

      @payment.identifier = 'CRED-'+SecureRandom.urlsafe_base64(11)
      @payment.save

      redirect_to payment_url(@payment.identifier) and return
    else
      @payment.amount -= current_user.credit
      @payment.save

      current_user.credit = 0
      current_user.save

      @payment.setup!(success_payments_url, cancel_payments_url)
      redirect_to @payment.redirect_uri and return
    end
  end

  def success
    payment = Payment.find_by_token!(params[:token])
    payment.complete!(params[:PayerID])
    redirect_to payment_url(payment.identifier)
  end

  def credits
    @payments = current_user.payments_from_failed_projects
  end

  def cancel
  end

  private

  def paypal_api_error(e)
    redirect_to root_url, error: e.response.details.collect(&:long_message).join('<br />')
  end

end
