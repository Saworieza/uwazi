class Coalition < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    
	has_many :parties
	has_many :politicians

	belongs_to :user
	
	def politicians
    Politician.where(:coalition_id => self.id).to_a 
  end
  	
  def parties
    Party.where(:coalition_id => self.id).to_a 
  end

  #create pretty urls by overiding the  to_param .. find out why the gem is better. only change then
  def to_param
    "#{id} #{name}".parameterize
  end
end
