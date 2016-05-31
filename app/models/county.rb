class County < ActiveRecord::Base
	has_many :constituencies
	has_many :politicians
	has_many :users
	
	def constituencies
    	Constituency.where(:county_id => self.id).to_a 
  	end
  	
  	def politicians
    	Politician.where(:county_id => self.id).to_a 
  	end

    #create pretty urls by overiding the  to_param .. find out why the gem is better. only change then
  def to_param
    "#{id} #{name}".parameterize
  end
end
