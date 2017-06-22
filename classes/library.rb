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

  def add_item(*args)
    args.each do |item|
      str_name = "@#{item.class}s".downcase;
      next unless arrayName = eval(str_name)
      self.add_item(item.author) if item.is_a?(Book)

      if item.is_a?(Order)
        self.add_item(item.book)
        self.add_item(item.reader)
      end

      arrayName << item if !arrayName.include?(item)
    end
  end

  def get_often_reader
    return "not found" if orders.size == 0
    result = @orders.group_by{ |item| item.reader.id }.sort_by{ |id_reader, reader| -reader.count }
    result.map!{ |item| item[1] }
    result[0].first.reader
  end

  def most_popular_book
    return "not found" if orders.size == 0
    get_grouped_orders[0].first.book
  end

  def how_many_get3popular_books
    return 0 if orders.size == 0
    three_books_in_groups = get_grouped_orders.first(3)
    three_books_in_groups.flatten.uniq{ |item| item.reader.id }.count
  end

  def get_grouped_orders
    result = @orders.group_by{ |item| item.book.id }.sort_by{ |id_book, book| -book.count }
    result.map!{ |item| item[1] }
    result
  end


  def save_library(path = './data/lib.yml')
    begin
      file = File.open(path, 'w') { |file| file.write self.to_yaml }
    rescue Exception => e
      puts "Couldn't save file\n#{e}"
    end
  end

  def load_library(path = './data/lib.yml')
    begin
      file = YAML.load_file(path)
      Index.reset
      @books = []
      @orders = []
      @readers = []
      @authors = []

      file.instance_variables.each { |item| file.instance_variable_get(item).each { |item2| self.add_item(item2) } }
    rescue Exception => e
      puts "Couldn't open file \n#{e}"
   end
  end
end
