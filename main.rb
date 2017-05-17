require "./classes/library.rb"

lib = Library.new
lib.loadLibrary



puts "Books:"
lib.books.each { |item| puts item.title }
puts "----"
puts "Authors:"
lib.authors.each { |item| puts item.name }
puts "----"
puts "Readers:"
lib.readers.each { |item| puts item.name }
puts "----"



puts "Top reader: " + lib.getOftenReader.to_s

puts "Top book: " + lib.mostPopularBook.to_s
puts "Number of people which ordered one of the three most popular books: " + lib.howManyGet3PopularBooks.to_s


