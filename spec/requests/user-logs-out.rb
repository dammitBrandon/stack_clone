require 'spec_helper'

describe "user logs out of the application" do
  before { visit root_path }

  context "logged in" do
    before { sign_in }
    it "should end the session" do
      click_button("Logout")
      expect(page).to have_content 'Logout Successful'
    end
  end
end
