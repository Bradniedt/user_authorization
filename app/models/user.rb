class User < ApplicationRecord
  validates_presence_of :full_name, :email_address, :password
  validates_uniqueness_of :email_address

  def self.authenticate(email, password)
    user = User.find_by(email_address: email)
    if user && user.email_address == email && user.password == password
      user
    else
      nil
    end
  end
end
