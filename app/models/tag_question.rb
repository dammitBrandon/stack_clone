class TagQuestion < ActiveRecord::Base
  validates_presence_of :question_id, :tag_id
  validates_uniqueness_of :question_id, :scope => :tag_id

  belongs_to :tag
  belongs_to :question
end
