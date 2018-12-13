require "rails_helper"

describe "as a user" do
  describe "when I visit the login path" do
    it "should be able to log in" do
      user = User.create(full_name: "Brad Niedt", email_address:"example@blank.com", password: "password")

      visit login_path

      fill_in "Email", with: user.email_address
      fill_in "Password", with: user.password
      click_on "Login"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(user.full_name)
    end

    it "should be able to log out" do
      user = User.create(full_name: "Brad Niedt", email_address:"example@blank.com", password: "password")

      visit login_path

      fill_in "Email", with: user.email_address
      fill_in "Password", with: user.password
      click_on "Login"


      click_on "Log Out"

      expect(current_path).to eq(login_path)
    end
  end
end
