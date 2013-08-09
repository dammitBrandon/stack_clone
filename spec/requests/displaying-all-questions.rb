require 'spec_helper'

describe "user views the home page" do
  [@question] << FactoryGirl.create(:question)

  context "arrive on the home page" do
    visit questions_path
    expect(page).to have_contect("WACK")

    it "should display a list of questions" do

  end
end
