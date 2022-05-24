class Label
  attr_reader :title, :color

  def initialize(title, color)
    @id = Random.rand
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end
end
