# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/i

  validates :name,  :presence   => true
  validates :email, :presence   => true
  validates :email, :format     => {:with => email_regex}
  validates :name,  :length     => {:maximum => 50}
  validates :email, :uniqueness => {:case_sensitive => false}

  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }

  before_save :encrypt_password

# Return true if the user's password matches the submitted password.
def has_password?(submitted_password)
  # compare encrypted_password with the encrypted version of 
  # submitted_password
end

private

  def encrypt_password
    self.encrypted_password = encrypt(password)
  end

  def encrypt (string)
    string # Only a temporary implementation!
  end

end
