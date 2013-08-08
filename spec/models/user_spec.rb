require 'spec_helper'

describe User do
  context 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_uniqueness_of(:email)}
    it { should_not allow_value("a@afdfa").for(:email) }
  end
  
  context 'associations' do
    it { should have_many(:questions) }
    it { should have_many(:answers) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end

end
