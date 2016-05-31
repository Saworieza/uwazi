class Politician < ActiveRecord::Base
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/image.svg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    
    has_many :bills
    
    belongs_to :coalition
    belongs_to :county
    belongs_to :party
    
    belongs_to :contest 
    
    def bills
    	Bill.where(:politician_id => self.id).to_a 
    end

    #create pretty urls by overiding the  to_param .. find out why the gem is better. only change then
    def to_param
      "#{id} #{full_name}".parameterize
    end
end
