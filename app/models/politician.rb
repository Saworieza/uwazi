class Politician < ActiveRecord::Base
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/image.svg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    
    has_many :bills
    
    belongs_to :coalition
    belongs_to :county
    belongs_to :party
    
    belongs_to :contest 
end
