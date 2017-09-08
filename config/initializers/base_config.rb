config = Rails.application.config
config.time_zone = 'Brasilia'
config.i18n.default_locale = 'pt-BR'

if Rails.env.production? 
  # DO fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => "" # Set the bucket name
    }
  }

  # Mailer configurations.
  config.action_mailer.default_url_options = { :host => 'base.maisapp.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
    address: ENV['SES_ADDRESS'],
    port: 587,
    domain: "maisapp.com",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV['SES_USERNAME'],
    password: ENV['SES_PASSWORD']
  }
end

