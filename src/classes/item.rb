require 'date'

class Item
  require_relative '../modules/json_methods'
  attr_reader :published_date, :genre, :label, :author

  def initialize(publish_date)
    @id = Random.rand
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def move_to_archive
    @archive = true if can_be_archived? == true
  end

  def genre=(genre)
    @genre = genre
    genre..item.push(self) unless label.item.include?(self)
  end

  def label=(label)
    @label = label
    label.item.push(self) unless label.item.include?(self)
  end

  def author=(author)
    @author = author
    author..item.push(self) unless label.item.include?(self)
  end

  def to_json(*args)
    parameters = set_arguments
    {
      JSON.create_id => self.class.name,
      'arguments' => parameters
    }.to_json(*args)
  end

  def self.json_create(object)
    arguments, associations = *object['arguments']
    item = new(*arguments)
    item.genre = associations[0]
    item.label = associations[1]
    item.author = associations[2]
    item
  end

  private

  def can_be_archived?
    Date.today.year - @published_date.year >= 10
  end

  def set_arguments
    arguments = [@id, @published_date]
    associations = [@genre, @label, @author]
    [arguments, associations]
  end
end
