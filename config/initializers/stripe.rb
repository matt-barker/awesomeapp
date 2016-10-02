if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_egczUDZdQUSj33m2FEn38Dzr',
    :secret_key => 'sk_test_0jKHdBPeGFLtFNJa8jdHWygo'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]