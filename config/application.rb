require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HostIt
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

RSpotify::authenticate("9d38d852e3ef44e68630237054efceef", "0eec3ae0c2e249ba9313ec266eab476c")

module SpotifyOmniauthExtension
  extend ActiveSupport::Concern

  def callback_url
    full_host + script_name + callback_path
  end 
end