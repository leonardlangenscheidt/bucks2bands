class Artist < ActiveRecord::Base
	has_many :upvotes
end
