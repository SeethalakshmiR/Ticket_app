# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # config.time_zone = 'Eastern Time (US & Canada)'
    # config.active_record.default_timezone = :local
    # config.time_zone = 'Kolkata'
    config.time_zone = 'UTC'
    config.active_record.default_timezone = :utc

    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false

    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
