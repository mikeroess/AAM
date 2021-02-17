class Criticism
  include ActiveModel::Model

  attr_accessor :id, :citation, :summary, :title, :full, :sidebar
  attr_writer :images

  cattr_accessor :all

  def full?
    full.present?
  end

  def summary?
    summary.present?
  end

  def sidebar?
    sidebar.present?
  end

  def images
    @images ||= []
  end

  def self.find(id)
    all.find { |c| c.id == id } || raise(NotFound)
  end

  class NotFound < RuntimeError; end
end
