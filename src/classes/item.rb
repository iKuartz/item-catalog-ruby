require 'date'

class Item
  attr_reader :label

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

# Here will be the json object creator

  private

  def can_be_archived?
    Date.today.year - @published_date.year >= 10
  end
end
