class Senator < ActiveRecord::Base
	has_many :bills

	#remeber to restrict, cn only belong to one party
	belongs_to :party
	belongs_to :county
end
