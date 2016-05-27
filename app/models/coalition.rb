class Coalition < ActiveRecord::Base
	has_many :parties
	has_many :politicians

	belongs_to :user
end
