require 'spec_helper'

describe "user" do
  before do
   visit root_path
   sign_in
   question = FactoryGirl.create(:question)
   answer = FactoryGirl.create(:answer)
   visit question_path(question)
  end

   

  context "submitting a comment on a Question" do
    before {click_link("Q Comment")}
    describe "with valid information" do
      before do 
        fill_in "comment_text", with: "Question text is the best"
      end
      it "should create a Question comment", :js => true do
        sleep(3)
        expect do
         click_button("Comment")
        end.to change(Comment, :count).by(1)
      end
    end
  end

  context "submitting a comment on an Answer" do
    before { click_link("A Comment") }
    describe "with valid information" do
      before do 
        fill_in "comment_text", with: "Answer text is the best"
      end
      it "should create an Answer comment", :js => true do
       sleep(3)
       expect do
        click_button("Comment")
       end.to change(Comment, :count).by(1)
      end
    end
  end
end 
