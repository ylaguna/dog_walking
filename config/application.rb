require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'

Bundler.require(*Rails.groups)

module DogWalkingApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    #Add Operations
    config.autoload_paths << Rails.root.join('app', 'operations', '**', '*.rb')
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
