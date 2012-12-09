class PaymentsController < ApplicationController
  rescue_from Paypal::Exception::APIError, with: :paypal_api_error
  before_filter :authenticate_user!, only: :create

  def show
    @payment = Payment.find_by_identifier!(params[:id])
  end

  def create
    payment = Payment.create!(params[:payment])
    payment.user = current_user
    # TODO: verify if project is active
    payment.project = Project.find(params[:project_id])
    payment.setup!(
      success_payments_url,
      cancel_payments_url
    )
    redirect_to payment.redirect_uri
  end

  def success
    payment = Payment.find_by_token!(params[:token])
    payment.complete!(params[:PayerID])
    # TODO: send email
    # OrderMailer.mail_order(@payment).deliver
    redirect_to payment_url(payment.identifier)
  end

  def cancel
    payment = Payment.find_by_token!(params[:token])
    payment.cancel!
    redirect_to root_url
  end

  def notify
    Paypal::IPN.verify!(request.raw_post)
  end

  private

  def paypal_api_error(e)
    redirect_to root_url, error: e.response.details.collect(&:long_message).join('<br />')
  end

end
