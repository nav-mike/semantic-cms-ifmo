require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Workspace
  # Application configuration class
  # @author M. Navrotskiy m.navrotskiy@gmail.com
  class Application < Rails::Application
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Moscow'
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Config gem
    Bundler.require(*Rails.groups)
    Config::Integration::Rails::Railtie.preload

    config.generators do |g|
      g.orm :active_record
      g.test_framework :rspec
      g.stylesheets true
      g.javascripts true
      g.jbuilder true
      g.assets false
      g.helper false
    end

    config.assets.paths << Rails.root.join("lib","assets","bower_components","angular-loading-bar", "build")
    config.assets.paths << Rails.root.join("lib", "assets", "bower_components", "angular-bootstrap")
  end
end
