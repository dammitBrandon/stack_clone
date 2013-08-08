module AuthenticationHelper
  def sign_in
    user = FactoryGirl.create(:user)
    fill_in "email", with: "john@example.com"
    fill_in "password", with: "password"
    click_button("Login")    
  end
end
