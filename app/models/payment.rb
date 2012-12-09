class Payment < ActiveRecord::Base
  attr_accessible :amount,
                  :token,
                  :identifier,
                  :payer_id,
                  :completed,
                  :canceled,
                  :user,
                  :project,
                  :project_id

  belongs_to :user
  belongs_to :project

  validates :token, :identifier, uniqueness: true, allow_blank: true

  def self.completed
    where(completed: true)
  end

  attr_reader :redirect_uri
  def setup!(return_url, cancel_url)
    response = client.setup(
      payment_request,
      return_url,
      cancel_url,
      pay_on_paypal: true,
      no_shipping: true
    )
    self.token = response.token
    self.save!
    @redirect_uri = response.redirect_uri
    self
  end

  def complete!(payer_id = nil)
    response = client.checkout!(self.token, payer_id, payment_request)
    self.payer_id = payer_id
    self.identifier = response.payment_info.first.transaction_id
    self.completed = true
    self.save!
    self
  end

  def incomplete?
    not self.completed?
  end

  def unsubscribe!
    client.renew!(self.identifier, :Cancel)
    self.cancel!
  end

  private

  def client
    Paypal::Express::Request.new(PAYPAL_CONFIG)
  end

  def payment_request
    Paypal::Payment::Request.new({
      amount: amount,
      currency_code: :BRL,
      items: [{
        name: project.title,
        amount: amount
      }]
    })
  end

end
