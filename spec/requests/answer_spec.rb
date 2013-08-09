require 'spec_helper'

describe "answer path" do

  let(:user) { User.create(name: "ryan", email: "ryan@ryan.com", password: "ryan") }
  let(:question) { user.questions.create(title: "rspec", text: "rspec2") }
  let(:answer) {user.answers.create(text: "HOLD", user_id: 2, question_id: 1)}

  before do 
    @answers = [answer]
    visit question_path(question)
  end

  it "should display a list of answers", :js => true do
    sleep(2)
    expect( page ).to have_content("HOLD")
  end

  it "should create an answer when passed valid parameters, then edit it and destroy it.", :js => true do
    visit root_path
    sign_in
    visit question_path(question)
    fill_in "Text", with: "MADE"
    expect do
      click_button "Create Answer"
    end.to change(Answer, :count).by(1)
    sleep(2)
    expect( page ).to have_content("MADE")
    click_button "Edit"
    fill_in "Text", with: "UNMADE"
    sleep(4)
    click_button "Update"
    sleep(4)
    click_button "Edit"
    sleep(2)
    expect do
      click_button "Delete"
    end.to change(Answer, :count).by(-1)
    sleep(5)
    expect( page ).to have_content("WACK")
  end
  
end
