require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Overtime
  class Application < Rails::Application
    config.load_defaults 5.0
    config.enable_dependency_loading = true
    config.autoload_paths << Rails.root.join('lib')
  end
end
