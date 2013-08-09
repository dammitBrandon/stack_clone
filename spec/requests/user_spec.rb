require 'spec_helper'

describe "user" do
  before { visit root_path }

  context "using register form" do
    let(:register) { "Register" }
    describe "with valid information" do
      before do 
        fill_in "user_name", with: "Ryan"
        fill_in "user_email", with: "example@example.com"
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "password"
      end
      it "should create a user", :js => true do
        sleep(1)
        expect do
         click_button register
        end.to change(User, :count).by(1)
      end
    end
  end

  context "using login form" do
    before { sign_in }
    it "should login a user", :js => true do
      sleep(1)
      expect(page).to have_content 'Welcome'
    end
  end
  
  context "logged in" do
    before { sign_in }
    it "should end the session", :js => true do
      sleep(3)
      click_button("Logout")
      expect(page).to have_content 'Logout Successful'
    end
  end
end 
