require 'yaml'
require './classes/index.rb'
require './classes/author.rb'
require './classes/order.rb'
require './classes/reader.rb'
require './classes/book.rb'


#Library emulation class
class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books = []
    @orders = []
    @readers = []
    @authors = []
  end

  def addItem(*args)
    args.each do |item|
      str_name = "@#{item.class}s".downcase;
      next unless instance_variable_defined?( str_name.to_sym )
      arrayName = eval(str_name)
      if arrayName


        self.addItem(item.author) if item.is_a?(Book)

        if item.is_a?(Order)
          self.addItem(item.book)
          self.addItem(item.reader)
        end

        is_exists = arrayName.include?(item)
        arrayName << item if !is_exists
      end
    end
  end


  def getOftenReader
    return "not found" if orders.size == 0
    result = @orders.group_by{ |item| item.reader.id }.sort_by{ |id_reader, reader| -reader.count }
    result.map!{ |item| item[1] }

    result[0].first.reader
  end


  def mostPopularBook
    return "not found" if orders.size == 0
    result = @orders.group_by{ |item| item.book.id }.sort_by{ |id_book, book| -book.count }
    result.map!{ |item| item[1] }

    result[0].first.book
  end

  def howManyGet3PopularBooks
    return 0 if orders.size == 0
    grouped_orders = @orders.group_by{ |item| item.book.id }.sort_by{ |id_book, book| -book.count }
    grouped_orders.map!{ |item| item[1] }

    three_books_in_groups = grouped_orders.first(3)

    common_group = []

    three_books_in_groups.each {|item| common_group |= item }
    total = common_group.uniq{ |item| item.reader.id }.count

    total
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

      file.readers.each { |item| self.addItem(item) }
      file.authors.each { |item| self.addItem(item) }
      file.books.each { |item| self.addItem(item) }
      file.orders.each { |item| self.addItem(item) }
    rescue Exception => e
      puts "Couldn't open file \n#{e}"
   end
  end
end

