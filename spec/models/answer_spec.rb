require 'spec_helper'

describe Answer do
  context 'validations' do
    it { should validate_presence_of(:text)}
    it { should validate_presence_of(:user_id)}
    it { should validate_presence_of(:question_id)}
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
    it { should have_many(:comments)}
  end
end
