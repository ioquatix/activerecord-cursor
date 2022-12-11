require "bundler/setup"

RSpec.configure do |config|
	# Enable flags like --only-failures and --next-failure
	config.example_status_persistence_file_path = ".rspec_status"

	config.expect_with :rspec do |c|
		c.syntax = :expect
	end
end

require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'test')

ActiveRecord::Schema.define do
	create_table :posts, force: true do |t|
	end
	create_table :comments, force: true do |t|
		t.integer :post_id
	end
end

class Post < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :post
end

Comment.transaction do
	Comment.delete_all
	
	2_000.times do
		Comment.create
	end
end
