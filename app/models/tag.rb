class Tag < ActiveRecord::Base
  validates_presence_of :title
  has_many :tag_questions
  has_many :questions, :through => :tag_questions
end
