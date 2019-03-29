require 'yaml'
require 'pathname'
require 'erb'

data_dir = Rails.root.join('config', 'data')

yaml_data_watcher = Rails.application.config.file_watcher.new([], data_dir.to_s => ['yml']) do
  {
    galleries: Gallery::Gallery,
    criticism: Criticism
  }.each_pair do |filename, model|
    yaml = data_dir.join("#{filename}.yml")
    raise "Could not load configuration. No such file - #{yaml}" unless yaml.exist?

    records = YAML.load(ERB.new(yaml.read).result)
    model.all = records.map.with_index do |attrs, index|
      attrs[:id] = index + 1 unless attrs['id']
      model.new(attrs)
    end.freeze
  end
end

Rails.application.reloaders << yaml_data_watcher
Rails.application.config.to_prepare { yaml_data_watcher.execute }
