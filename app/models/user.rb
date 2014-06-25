class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	validates :first_name, :last_name, presence: true

	acts_as_followable
	acts_as_follower
	has_many :posts
	has_many :comments
	acts_as_liker
	has_many :posts

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "avatar/missing.jpg"

	def full_name
		([first_name, last_name] - ['']).compact.join(' ')
	end
end
