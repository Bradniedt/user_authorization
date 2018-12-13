require "rails_helper"

describe "as a user" do
  describe "when I visit the page to create a user" do
    it "should see a form to create a user and be able to create a user" do
      visit new_user_path

      fill_in :user_full_name, with: "Bradley Niedt"
      fill_in :user_email_address, with: "example@email.com"
      fill_in :user_password, with: "password"
      click_on "Create User"

      user = User.all.last

      expect(current_path).to eq(user_path(user))
      expect(User.all.last).to eq(user)
    end
  end
end
