class Book < Index
  attr_accessor :title, :author

  def initialize(title, author)
  	raise "Couldn't create book" if !author.is_a?(Author)

  	super()
    @title = title
    @author = author
  end

  def to_s
  	"#{@title} - #{@author.name}"
  end
end
