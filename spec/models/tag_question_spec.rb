require 'spec_helper'

describe TagQuestion do
  context "Validations" do
    it { should belong_to(:question) }
    it { should belong_to(:tag) }
  end
  context "Associations" do
    it { should validate_presence_of(:question_id) }
    it { should validate_presence_of(:tag_id) }
  end
end
