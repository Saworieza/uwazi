class Party < ActiveRecord::Base
	belongs_to :coalition
	has_many :politicians
end
