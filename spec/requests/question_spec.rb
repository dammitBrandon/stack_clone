require 'spec_helper'

describe "questions path" do

  let(:user) { User.create(name: "ryan", email: "ryan@ryan.com", password: "ryan") }
  let(:question) { user.questions.create(title: "rspec", text: "rspec2") }

  before do 
    @questions = [question]
    visit questions_path
  end

  it "should display a list of questions" do
    expect( page ).to have_content("rspec")
  end

  it "should redirect to question show page on link click" do
    click_link "rspec"
    expect(current_path).to eq question_path(question)
  end

  it "should destroy a question" do
    visit edit_question_url(question)
    click_button "Delete"
    expect(current_path).to eq questions_path
  end

  it "should edit the body of a question" do
    visit edit_question_url(question)
    fill_in "Text", with: "COW"
    click_button "Update Question"
    expect(current_path).to eq question_path(question)
    expect( page ).to have_content("COW")
  end

  it "should create a question when passed valid parameters" do
    visit root_path
    sign_in
    visit new_question_url
    fill_in "Title", with: "COW"
    fill_in "Text", with: "MOO"
    click_button "Create Question"
    expect( page ).to have_content("MOO")
  end
end
