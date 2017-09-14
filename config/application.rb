require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_model/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
#
# See https://github.com/rails/rails/commit/49c4af43ec5819d8f5c1a91f9b84296c927ce6e7#commitcomment-4449619.
Bundler.require(*Rails.groups(assets: %w[development test]))

module Ann
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Backport of Rails 4.2+ `Rails::Application#config_for`.
    def config_for(name)
      yaml = Pathname.new("#{paths["config"].existent.first}/#{name}.yml")

      if yaml.exist?
        require "erb"
        (YAML.load(ERB.new(yaml.read).result) || {})[Rails.env] || {}
      else
        raise "Could not load configuration. No such file - #{yaml}"
      end
    rescue Psych::SyntaxError => e
      raise "YAML syntax error occurred while parsing #{yaml}. " \
        "Please note that YAML must be consistently indented using spaces. Tabs are not allowed. " \
        "Error: #{e.message}"
    end
  end
end
