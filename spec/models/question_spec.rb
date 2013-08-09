require 'spec_helper'

describe Question do 
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments)}
    it { should have_many(:tag_questions)}
    it { should have_many(:tags)}
  end
end
