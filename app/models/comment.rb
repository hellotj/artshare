class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post
    include PublicActivity::Model
    acts_as_likeable
    tracked owner: ->(controller, model) { controller && controller.current_user }
    validates_length_of :content, allow_blank: false
    
end
