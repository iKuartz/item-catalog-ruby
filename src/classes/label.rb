require_relative '../modules/json_methods'

class Label
  attr_reader :title, :color
  attr_accessor :items

  include JsonMethods

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self unless item.label == self
  end

  def self.json_create(object)
    new(*object['arguments'])
  end
end
