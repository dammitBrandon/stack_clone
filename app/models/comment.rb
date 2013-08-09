class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :commentable_type, :commentable_id

  validates_presence_of :text
  validates_presence_of :user_id

  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
