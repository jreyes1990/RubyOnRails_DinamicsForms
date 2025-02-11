require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppDinamicsForms
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # config.session_store :active_record_store, :key => '_redmine_session'

    # Para evitar que se generen los archivos de especificación (specs)
    # al utilizar el comando rails generate scaffold_controller
    config.generators do |g|
      g.test_framework :rspec
      g.helper false
      g.assets false
      g.view_specs false
      g.helper_specs false
      g.controller_specs false
    end
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
