class County < ActiveRecord::Base
	has_many :constituencies
	has_many :politicians
	has_many :users
	
	def constituencies
    	Constituency.where(:county_id => self.id).to_a 
  	end
end
