
require 'securerandom'

module ActiveRecord
	module Cursor
		class BufferedQuery
			include Enumerable
			
			def initialize(query, buffer_size: 1000, connection: ::ActiveRecord::Base.connection)
				@query = @query
				@connection = connection
				
				@buffer_size = buffer_size
			end
			
			attr :query
			attr :connection
			attr :count
			
			def each
				return to_enum(:each) unless block_given?
				
				uuid = SecureRandom.uuid.tr('-', '')
				@connection.execute("DECLARE cursor_#{uuid} NO SCROLL CURSOR FOR #{@query}")
				
				@buffer = []
				@count = 0
				
				loop do
					@buffer = @connection.execute("FETCH #{@block_size} FROM cursor_#{uuid}")
					
					@buffer.each do |row|
						@count += 1
						yield row
					end
				end
				
				return @count
			ensure
				@connection.execute("CLOSE cursor_#{uuid}")
			end
		end
	end
end
