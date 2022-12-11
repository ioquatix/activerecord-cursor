
require "active_record/cursor"

RSpec.describe ActiveRecord::Cursor do
	it "should have some records" do
		expect(Comment.count).to be > 0
	end
	
	it "should enumerate records" do
		Comment.find_each do |record|
			puts record.inspect
		end
	end
end
