require 'yaml'
require 'pathname'
require 'erb'

Rails.application.config.to_prepare do
  {
    galleries: Gallery::Gallery,
    criticism: Criticism
  }.each_pair do |filename, model|
    yaml = Pathname.new("#{Rails.application.paths['config'].existent.first}/data/#{filename}.yml")
    raise "Could not load configuration. No such file - #{yaml}" unless yaml.exist?

    records = (YAML.load(ERB.new(yaml.read).result) || {}) || {}
    model.all = records.map.with_index do |attrs, index|
      attrs[:id] = index + 1 unless attrs['id']
      model.new(attrs)
    end
  end
end
