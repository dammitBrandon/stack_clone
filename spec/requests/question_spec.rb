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

  it "should create an question when passed valid parameters, then edit it and destroy it.", :js => true do
    visit root_path
    sign_in
    click_link "Create Question"
    fill_in "Title", with: "COW"
    fill_in "Text", with: "MOO"
    expect do
      click_button "Create Question"
    end.to change(Question, :count).by(1)
    expect( page ).to have_content("MOO")
    click_link "Home"
    expect( page ).to have_content("COW")
    click_button "Edit"
    fill_in "Text", with: "QUACK"
    click_button "Update"
    click_link "Home"
    click_button "Edit"
      click_button "Delete"
    expect(current_path).to eq questions_path
    expect( page ).to_not have_content("COW")
  end
end
