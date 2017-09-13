# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

# See https://github.com/rails/rails/commit/49c4af43ec5819d8f5c1a91f9b84296c927ce6e7#commitcomment-12427156.
namespace :assets do
  task :environment do
    Bundler.require(:assets)
    already_initialized = Rails.application.railties.collect(&:class)
    railties = Rails::Railtie.subclasses
    engines = Rails::Engine.subclasses
    (railties + engines - already_initialized).each do |engine|
      engine.instance.run_initializers(:default, Rails.application)
    end
  end
end

Ann::Application.load_tasks
