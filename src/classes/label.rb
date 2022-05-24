class Label
  attr_reader :title, :color

  def initialize
    @id = Random.rand
    @title = title
    @color = color
    @items = []
  end
end
