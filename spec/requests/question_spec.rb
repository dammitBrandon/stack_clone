require 'spec_helper'

describe "questions path" do

  let(:user) { User.create(name: "ryan", email: "ryan@ryan.com", password: "ryan") }
  let(:question) { user.questions.create(title: "rspec", text: "rspec2") }

  before do
    p question
    @questions = [question]
    visit questions_path
  end

  it "should display a list of questions", :js => true do
    expect( page ).to have_content("rspec")
    sleep(3)
  end

  it "should redirect to question show page on link click", :js => true do
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
      sleep(3)
      click_button "Create Question"
    end.to change(Question, :count).by(1)
    sleep(2)
    expect( page ).to have_content("MOO")
    click_link "Home"
    sleep(2)
    expect( page ).to have_content("COW")
    click_button "Edit"
    fill_in "Text", with: "QUACK"
    sleep(4)
    click_button "Update"
    sleep(4)
    click_link "Home"
    click_button "Edit"
    sleep(2)
      click_button "Delete"
    sleep(5)
    expect(current_path).to eq questions_path
    expect( page ).to_not have_content("COW")
  end
end
