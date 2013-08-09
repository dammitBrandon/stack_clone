require 'spec_helper'

describe "answer path" do

  let(:user) { User.create(name: "ryan", email: "ryan@ryan.com", password: "ryan") }
  let(:question) { user.questions.create(title: "rspec", text: "rspec2") }
  let(:answer) {user.answers.create(text: "HOLD", user_id: 1, question_id: 1)}

  before do 
    @answers = answer
    visit question_path(question)
  end

  it "should display a list of answers" do
    expect( page ).to have_content("HOLD")
  end

  it "should destroy a answer" do
    visit edit_question_url(answer)
    click_button "Delete"
    expect(current_path).to eq questions_path
  end

  # it "should edit the body of a question" do
  #   visit edit_question_url(question)
  #   fill_in "Text", with: "COW"
  #   click_button "Update Question"
  #   expect(current_path).to eq question_path(question)
  #   expect( page ).to have_content("COW")
  # end

  # it "should create a question when passed valid parameters" do
  #   visit root_path
  #   sign_in
  #   visit new_question_url
  #   fill_in "Title", with: "COW"
  #   fill_in "Text", with: "MOO"
  #   click_button "Create Question"
  #   expect( page ).to have_content("MOO")
  # end
end
