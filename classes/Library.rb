require 'yaml'
require './classes/Index.rb'
require './classes/Author.rb'
require './classes/Order.rb'
require './classes/Reader.rb'
require './classes/Book.rb'

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize
  	@books = []
  	@orders = []
  	@readers = []
  	@authors = []
  end


  def addBooks(*args)
    args.each do |item|
      next unless item.is_a?(Book)
      self.addAuthors(item.author)


      is_exists = @books.include?(item)
	  @books << item if !is_exists
    end
  end


  def addOrders(*args)
  	args.each do |item|
  	  next unless item.is_a?(Order)
      self.addBooks(item.book)
      self.addReaders(item.reader)

      is_exists = @orders.include?(item)
	  @orders << item if !is_exists
    end
  end


  def addReaders(*args)
  	args.each do |item|
  	  next unless item.is_a?(Reader)
      is_exists = @readers.include?(item)
	  @readers << item if !is_exists
    end
  end


  def addAuthors(*args)
  	args.each do |item|
  	  next unless item.is_a?(Author)
      is_exists = @authors.include?(item)
	  @authors << item if !is_exists
    end
  end


  def getOftenReader
  	return "not found" if orders.size == 0

  	arr = Hash.new(0)

    @orders.each do |item|
    	arr[item.reader.id] = arr[item.reader.id] + 1
    end


    reader = arr.max_by{ |reader_id, count| count }
    result = @readers.select { |item| item.id == reader[0] }

    result[0]
  end


  def mostPopularBook
  	return "not found" if orders.size == 0

  	arr = Hash.new(0)

    @orders.each do |item|
    	arr[item.book.id] = arr[item.book.id] + 1
    end

    book = arr.max_by{ |book_id, count| count }
    result = @books.select { |item| item.id == book[0] }

    #[result[0], book[1]]
    result[0]
  end


  def howManyGet3PopularBooks
    return 0 if orders.size == 0

    arr = Hash.new(0)

    @orders.each do |item|
    	arr[item.book.id] = arr[item.book.id] + 1
    end

    top_popular = arr.sort_by { |key, val| val }.reverse

    ids = top_popular.first(3)
    ids.map! { |item| item[0] }
    total = @orders.select { |item| ids.include?(item.book.id) }
    total.uniq! { |item| item.reader.id }

    total.count

    #puts "total:#{total.count}"
    #puts top_popular.inspect
    #puts ids.inspect
    #puts total.inspect
  end


  def saveLibrary(path = './data/lib.yml')
  	begin
      file = File.open(path, 'w') { |file| file.write self.to_yaml }
    rescue Exception => e
    	puts "Couldn't save file\n#{e}"
    end
  end


  def loadLibrary(path = './data/lib.yml')
  	begin
      file = YAML.load_file(path)
      Index.reset

  	  @books = []
  	  @orders = []
  	  @readers = []
  	  @authors = []

      file.readers.each { |item| self.addReaders(item) }
      file.authors.each { |item| self.addAuthors(item) }
      file.books.each { |item| self.addBooks(item) }
      file.orders.each { |item| self.addOrders(item) }

    rescue Exception => e
	  puts "Couldn't open file \n#{e}"
    end
  end

end
