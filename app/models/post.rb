class Post < ActiveRecord::Base

	belongs_to :user
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :comments
  acts_as_likeable
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  validates_length_of :content, allow_blank: false
    
end
