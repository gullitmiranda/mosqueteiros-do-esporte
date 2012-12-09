require 'paypal/express'

PAYPAL_CONFIG = {
  username:  ENV['PAYPAL_USERNAME'],
  password:  ENV['PAYPAL_PASSWORD'],
  signature: ENV['PAYPAL_SIGNATURE']
}

if ENV['PAYPAL_SANDBOX'] == "true"
  PAYPAL_CONFIG[:sandbox] = true
  Paypal.sandbox!
end