class Party < ActiveRecord::Base
	belongs_to :coalition
	has_many :politicians
	
	def politicians
    	Politician.where(:party_id => self.id).to_a 
  	end
end
