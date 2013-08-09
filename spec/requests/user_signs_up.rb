require 'spec_helper'
describe "user creates an account" do
  before { visit root_path }

  context "User fills out and submits register form" do
    let(:register) { "Register" }
    describe "with valid information" do
      before do
        fill_in "user_name", with: "Ryan"
        fill_in "user_email", with: "example@example.com"
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "password"
      end
      it "should create a user" do
        expect do
         click_button register
        end.to change(User, :count).by(1)
      end
    end
  end
end
