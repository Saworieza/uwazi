class Constituency < ActiveRecord::Base
	belongs_to :county

	#create pretty urls by overiding the  to_param .. find out why the gem is better. only change then
	def to_param
	  "#{id} #{name}".parameterize
	end
end
