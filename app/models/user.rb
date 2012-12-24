# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
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

end
