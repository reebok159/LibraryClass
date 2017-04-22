require 'yaml'


=begin
lib = Library.new

book1 = Book.new("Steve Jobs", "Aizekson")
book2 = Book.new("Math", "Pifagor")
book3 = Book.new("The old man and sea", "Hemingway")
book4 = Book.new("Ruby for 2 days", "Unknown")

lib.addBooks(book1, book2, book3, book4)


au1 = Author.new("Hemingway", "tset1")
au2 = Author.new("Aizekson", "test")
lib.addAuthors(au1, au2)
reader1 = Reader.new("Ivan", "test@mail.ru", "New York", "WW", "54")
reader2 = Reader.new("Petr", "test@gmail.com", "Moskow", "Gagarina", "226")
lib.addReaders(reader1, reader2)

ord1 = Order.new(book1, reader1, Date.new(2017))
ord2 = Order.new(book2, reader1, Date.new(2017))
ord3 = Order.new(book3, reader1, Date.new(2017))
ord4 = Order.new(book3, reader2, Date.new(2017))
ord5 = Order.new(book4, reader2, Date.new(2017))

lib.addOrders(ord1, ord2, ord3, ord4, ord5)

lib.getOftenReader
lib.mostPopularBook
lib.howManyGet3PopularBooks

lib.saveLibrary
lib.loadLibrary
Index.reset
=end
