class Post < ActiveRecord::Base

	belongs_to :user

	has_attached_file :avatar, :styles => { :original => ['1920x1680>', :jpg, :convert_options => "-auto-orient", :quality => 100], :large => ['600x600>', :jpg, :convert_options => "-auto-orient", :quality => 100] }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :comments
  acts_as_likeable
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
    
end
