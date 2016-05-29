class Party < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
	belongs_to :coalition
	has_many :politicians
	
	def politicians
    	Politician.where(:party_id => self.id).to_a 
  	end
end
