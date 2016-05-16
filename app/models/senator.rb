class Senator < ActiveRecord::Base
	has_many :bills
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	#remeber to restrict, cn only belong to one party
	belongs_to :party
	belongs_to :county
end
