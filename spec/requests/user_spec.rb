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
    before { user = FactoryGirl.create(:user)}
    let(:submit) { "Login" }
    describe "with valid information" do
      before do
        fill_in "email", with: "john@example.com"
        fill_in "password", with: "password"
      end
        it "should login a user", :js => true do
          sleep(1)
          click_button submit
          expect(page).to have_content 'Welcome'
        end
    end
  end
end


 # expect { click_button submit }.to change(User, :count).by(1)
