class Order < Index
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date = Date.today)
  	raise "Couldn't create order" if !book.is_a?(Book) || !reader.is_a?(Reader)

  	super()
  	@book, @reader, @date = book, reader, date
  end


  def to_s
  	"[#{@id}] - Date: #{@date}, Reader: #{@reader.name}, Book: #{@book.title}"
  end

end
