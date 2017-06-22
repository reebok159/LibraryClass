require "./classes/library.rb"

lib = Library.new
lib.load_library



puts "Books:"
lib.books.each { |item| puts item.title }
puts "----"
puts "Authors:"
lib.authors.each { |item| puts item.name }
puts "----"
puts "Readers:"
lib.readers.each { |item| puts item.name }
puts "----"



puts "Top reader: " + lib.get_often_reader.to_s

puts "Top book: " + lib.most_popular_book.to_s
puts "Number of people which ordered one of the three most popular books: " + lib.how_many_get3popular_books.to_s


