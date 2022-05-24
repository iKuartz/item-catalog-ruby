require 'date'

class Item

  def initialize(publish_date)
    @id = Random.rand
    @publish_date = Date.parse(publish_date)
    @archived = false
  end
end
