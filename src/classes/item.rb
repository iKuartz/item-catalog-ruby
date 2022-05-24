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

end
