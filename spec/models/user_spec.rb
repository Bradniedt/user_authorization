require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:full_name)}
    it { should validate_presence_of(:email_address)}
    it { should validate_presence_of(:password)}

    it {should validate_uniqueness_of(:email_address)}
  end
end
