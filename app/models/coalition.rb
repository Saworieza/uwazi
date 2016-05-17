class Coalition < ActiveRecord::Base
	has_many :parties
	has_many :politicians
end
