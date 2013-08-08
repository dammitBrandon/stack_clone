require 'spec_helper'

describe "user" do
  before { visit root_path }
  let(:submit) { "Login" }
  context "on index page" do
    describe "with valid information" do
      before do
        fill_in "Email", with: "example@example.com"
        fill_in "Password", with: "password"
      end
        it "should login a user" do
          expect { click_button submit }.to change(User, :count).by(1)
        end
    end
  end
end
