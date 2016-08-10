class Debate < ActiveRecord::Base
	#before_action :authenticate_user!

	validates :user_id, presence: true
	belongs_to :category
	belongs_to :user

	acts_as_votable
	acts_as_commentable
end
