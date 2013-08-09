require 'spec_helper'

describe "user" do
  before { visit root_path }
  user = FactoryGirl.create(:user)

  context "when on register form" do
    let(:register) { "Register" }

    describe "with valid information" do
      before do    
        fill_in "user_name", with: user.name
        fill_in "user_email", with: user.email
        fill_in "user_password", with: user.password
        fill_in "user_password_confirmation", with: user.password
      end
      it "should create a user", :js => true do
        sleep(1)
        expect { click_button register }.to change(User, :count).by(1)
      end
    end

     describe "with invalid information" do
      before do 

        fill_in "user_email", with: user.email
        fill_in "user_password", with: user.password
        fill_in "user_password_confirmation", with: user.password
      end
      it "should display an error", :js => true do
        click_button register 
        expect(page).to have_content 'Registration Failed, please try again.'
      end
    end
  end

  context "when on login form" do
    let(:login) { "Login" }

    describe "with valid information" do
      before { sign_in }
      it "should login a user", :js => true do
        expect(page).to have_content 'Welcome'
      end
    end

    describe "with invalid information" do
      it "should display an error", :js => true do
        click_button login
        expect(page).to have_content 'Sign in failed, please try again.'
      end
    end
  end
  
  context "when logged in" do
    let(:logout) { "Logout" }

    before { sign_in }
    it "should end the session", :js => true do
      click_button logout
      expect(page).to have_content 'Logout Successful'
    end
  end
end 
