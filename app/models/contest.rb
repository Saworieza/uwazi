class Contest < ActiveRecord::Base
    has_many :politicians

  def politicians
    Politician.where(:coalition_id => self.id).to_a 
  end

  #create pretty urls by overiding the  to_param .. find out why the gem is better. only change then
	def to_param
	  "#{id} #{name}".parameterize
	end
end
