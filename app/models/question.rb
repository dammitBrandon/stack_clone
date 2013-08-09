class Question < ActiveRecord::Base

  attr_accessible :title, :text, :user_id, :tag_names
  attr_accessor   :tag_names

  belongs_to :user
  has_many   :answers
  has_many   :comments
  has_many   :tag_questions, dependent: :destroy 
  has_many   :tags, :through => :tag_questions 

  validates_presence_of :title, :text

  def create_tags
    tag_names.split(',').each do |tag| 
      self.tags << Tag.find_or_create_by_title(tag.strip)
    end
  end

end
