class Bill < ActiveRecord::Base
	validates :user_id, presence: true

	
	has_attached_file :document, styles: {:thumbnail => ["200x160>", :png], :medium => ["250x250>"]}
    validates_attachment :document, content_type: { :content_type => ["image/jpg", "image/jpeg", "image/png", "application/pdf"]}
	
	
	acts_as_votable
	acts_as_commentable
	  
	belongs_to :politician
	belongs_to :user
end
