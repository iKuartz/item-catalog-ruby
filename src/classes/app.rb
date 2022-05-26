require_relative './books'
require_relative './labels'
require_relative './genres'
require_relative './musics'
require_relative './games'
require_relative './authors'
require_relative '../modules/json_handler'

class App
  include JsonHandler

  def initialize
    @books = BooksCollection.new
    @games = GameCollection.new
    @musics = MusicCollection.new
    @genres = GenreCollection.new
    @authors = AuthorCollection.new
    @labels = LabelCollection.new
  end

  def run(num)
    system('clear')
    case num
    when 1..6
      list_tasks(num)
    when 7..9
      add_tasks(num)
    when 10
      handle_exit
    else
      puts 'Wrong input, Returning to main menu'
    end
  end

  def list_tasks(num)
    case num
    when 1 then @books.list
    when 2 then @musics.list
    when 3 then @games.list
    when 4 then @genres.display
    when 5 then @labels.display
    when 6 then @authors.display
    end
    print "\nPress Enter to return"
    gets.chomp
    system('clear')
  end

  def add_tasks(num)
    case num
    when 7 then @books.add(@genres, @labels, @authors)
    when 8 then @musics.add(@genres, @labels, @authors)
    when 9 then @games.add(@genres, @labels, @authors)
    end
  end

  def handle_exit
    unless Dir.exist?(File.join(File.dirname(__FILE__), '../json'))
      FileUtils.mkdir_p(File.join(File.dirname(__FILE__), '../json'))
    end
    write_json(File.join(File.dirname(__FILE__), '../json/music.json'), @musics.album)
    write_json(File.join(File.dirname(__FILE__), '../json/books.json'), @books.books)
    write_json(File.join(File.dirname(__FILE__), '../json/games.json'), @games.games)
    write_json(File.join(File.dirname(__FILE__), '../json/labels.json'), @labels.list)
    write_json(File.join(File.dirname(__FILE__), '../json/author.json'), @authors.list)
    write_json(File.join(File.dirname(__FILE__), '../json/genres.json'), @genres.list)
    'exit'
  end
end
