class PaymentsController < ApplicationController
  rescue_from Paypal::Exception::APIError, with: :paypal_api_error
  before_filter :authenticate_user!

  def show
    @payment = Payment.find_by_identifier(params[:id])
    redirect_to root_url unless @payment.present? or current_user.payments.any?
  end

  # credit = 60
  # amount = 60
  # if amount > credit
  #   credit_used = amount - credit
  # else
  #   credit_used = amount
  # end # 0
  # to_pay = amount - credit_used # 30
  # credit -= credit_used # 200

  def create
    @payment = Payment.new(params[:payment])
    
    if params[:payment][:amount].to_i >= 60 and @payment.project.active?
      @payment.user = current_user
      # if current_user.credit > 0
      #   @payment.amount = 
      # end
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
    @payment.setup!(success_payments_url, cancel_payments_url)
    redirect_to @payment.redirect_uri
  end

  def success
    payment = Payment.find_by_token!(params[:token])
    payment.complete!(params[:PayerID])
    redirect_to payment_url(payment.identifier)
  end

  def credits
    @payments = current_user.payments_from_failed_projects
  end

  private

  def paypal_api_error(e)
    redirect_to root_url, error: e.response.details.collect(&:long_message).join('<br />')
  end

end