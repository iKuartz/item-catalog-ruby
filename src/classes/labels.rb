require_relative './label'
require_relative './item_collection'
require_relative '../modules/json_handler'

class AuthorCollection < TypeCollection
  include JsonHandler
  attr_reader :list

  def initialize
    super
    @list = create_defaults
  end

  def get
    choice = super
    if choice == 1
      display
      index = verify_index(@list)
      @list[index]
    else
      create_label
    end
  end

  def display
    @list.each_with_index do |label, index|
      puts "#{index}) Title: #{label.title},  Color: #{label.color}"
    end
  end

  private

  def create_label
    id = verify_int(message: 'Label ID: ', error: 'Please input correct numeric id: ')
    title = verify_str(message: 'Title: ', error: 'Please input a string for Title: ')
    color = verify_str(message: 'Color: ', error: 'Please input a string for Color: ')
    new_label = Label.new(id, title, color)
    @list << new_label
    new_label
  end

  def create_defaults
    label1 = Label.new(1, 'Political Science', 'Green')
    label2 = Label.new(2, 'Kids Collection', 'Blue')
    labels = load_json(File.join(File.dirname(__FILE__), '../json/label.json'))
    if labels.empty?
      @list.push(label1, label2)
    else
      @list = labels
    end
  end
end
