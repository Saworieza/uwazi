class County < ActiveRecord::Base
	has_many :politicians
	has_many :users
end
