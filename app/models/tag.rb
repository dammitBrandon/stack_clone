class Tag < ActiveRecord::Base
  attr_accessible :title
  validates :title, presence: true, uniqueness: true 
  has_many :tag_questions, dependent: :destroy 
  has_many :questions, :through => :tag_questions
  belongs_to :user
  
end
