class Index
	attr_reader :id
	@@counter = 0

	def initialize
      @@counter += 1
      @id = @@counter
    end

    private
    def self.reset
    	@@counter = 0
    	#puts "Counter: #{@@counter}"
    end
end
