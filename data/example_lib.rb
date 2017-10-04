module Generator
  def init
    lib = Library.new

    #list authors
    author1 = Author.new("E. Hemingway")
    author2 = Author.new("L. Tolstoy")
    author3 = Author.new("M. Bulgakov")
    author4 = Author.new("F. Dostoevsky")
    author5 = Author.new("W. Shakespeare")

    lib.add_item(author1, author1, author3, author4, author5)

    #list books
    book11 = Book.new("The Old Man and the Sea", author1)
    book12 = Book.new("It Our Time", author1)
    book13 = Book.new("The Garden of Eden", author1)
    lib.add_item(book11, book12, book13)

    book21 = Book.new("War and Peace", author2)
    book22 = Book.new("Anna Karenina", author2)
    book23 = Book.new("Great Short Works", author2)
    book24 = Book.new("The Cossacks", author2)
    lib.add_item(book21, book22, book23, book24)

    book31 = Book.new("The Master and Margarita", author3)
    book32 = Book.new("Heart of a Dog", author3)
    lib.add_item(book31, book32)

    book41 = Book.new("Crime and Punishment", author4)
    book42 = Book.new("The Brothers Karamazov", author4)
    book43 = Book.new("The Idiot", author4)
    lib.add_item(book41, book42, book43)

    book51 = Book.new("Hamlet", author5)
    book52 = Book.new("Romeo and Juliet", author5)
    book53 = Book.new("Othello", author5)
    book54 = Book.new("Shakespeare's Sonnets", author5)
    lib.add_item(book51, book52, book53, book54)


    #list readers
    reader1 = Reader.new("Petr Petrov", "pp223@gmail.com")
    reader2 = Reader.new("Ivan Ivanov", "ivanich@gmail.com", "Moskow", "Gagarina", "76")
    reader3 = Reader.new("Nikolay Grishin", "tsetter@mail.ru")
    reader4 = Reader.new("Alexandr Myasnikov", "myasnikov123@gmail.com", "Kiev")
    lib.add_item(reader1, reader2, reader3, reader4)



    #list orders
    order1 = Order.new(book21, reader1, Date.new(2016))
    order2 = Order.new(book32, reader1)
    order3 = Order.new(book41, reader1)
    order4 = Order.new(book42, reader1)
    order5 = Order.new(book43, reader1)
    order6 = Order.new(book51, reader1)

    order7 = Order.new(book41, reader2)
    order8 = Order.new(book41, reader3)
    lib.add_item(order1, order2, order3, order4, order5, order6, order7, order8)


    order9 = Order.new(book42, reader4)
    order10 = Order.new(book42, reader3)
    order11 = Order.new(book42, reader2)
    order12 = Order.new(book51, reader2)
    lib.add_item(order9, order10, order11, order12)


    lib
  end
end
