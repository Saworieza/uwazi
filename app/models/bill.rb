class Bill < ActiveRecord::Base
	has_attached_file :document, styles: {thumbnail: "60x60#"}
    validates_attachment :document, content_type: { :content_type => ["image/jpg", "image/jpeg", "image/png", "application/pdf"]}
	
	
	acts_as_votable
	acts_as_commentable
	  
	belongs_to :politician
end
