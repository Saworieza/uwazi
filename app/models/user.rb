class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/image.svg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  belongs_to :county
  has_many :bills
  has_many :coalitions
  has_many :debates
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessor :login
  
  # Only allow letter, number, underscore and punctuation.
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
  
  #create pretty urls by overiding the  to_param .. find out why the gem is better. only change then
  def to_param
    "#{id} #{username}".parameterize
  end

  def user_params
      params.require(:user).permit(:avatar)
  end

end
