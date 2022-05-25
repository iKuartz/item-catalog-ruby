require_relative './book'
require_relative '../modules/verify_format_method'
require_relative '../modules/json_handler'

class BooksCollection
  attr_reader :books

  include CommonChecks
  include JsonHandler

  def initialize
    @books = load_json(File.join(File.dirname(__FILE__), '../json/books.json'))
  end

  def add(genre_coll, label_coll, author_coll)
    publish_date = verify_date(message: 'Publish Date [yyyy-mm-dd]: ',
                               error: 'Please input date in the correct format yyyy-mm-dd: ')
    publisher = verify_str(message: 'Write the name of the publisher: ')
    cover_state = good_or_bad(message: 'What is the current state of the book cover (good/bad): ',
                              error: 'Please type good or bad only: ')
    new_book = Book.new(publisher, cover_state, publish_date)
    new_book.genre = genre_coll.get
    new_book.author = author_coll.get
    new_book.label = label_coll.get
    @books << new_book
    print 'Book created and saved successfully. Press enter to continue. '
    gets.chomp
  end

  def list
    system('clear')
    @books.each_with_index do |book, index|
      print "#{index}) Label: #{book.label.title}, Author: #{book.author.first_name} #{book.author.last_name}\n"
      print "Genre: #{book.genre.name}, Publisher: #{book.publisher}\n"
      print "Publish Date: #{book.published_date}\n\n"
    end
  end
end
