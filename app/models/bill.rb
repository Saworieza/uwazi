class Bill < ActiveRecord::Base
	#require 'mini_magick'
	#pdf = Magick::ImageList.new("doc.pdf")
	#thumb = pdf.scale(300, 300)
	#thumb.write "doc.png"
	
	has_attached_file :document, styles: {:thumbnail => ["200x160#", :png]}
    validates_attachment :document, content_type: { :content_type => ["image/jpg", "image/jpeg", "image/png", "application/pdf"]}
	
	
	acts_as_votable
	acts_as_commentable
	  
	belongs_to :politician
end
