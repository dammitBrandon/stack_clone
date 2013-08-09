require 'spec_helper'

describe Tag do
  context 'validations' do
    it { should validate_presence_of(:title)}
  end
  
  context 'associations' do
    it { should have_many(:tag_questions)}
    it { should have_many(:questions) }
  end

end
