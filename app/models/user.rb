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
#  salt               :string(255)
#
require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :password, :password_confirmation

  has_many :microposts

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

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password) 
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def feed
  # this is preliminary. see chapter 12 for the full implementation.
  Micropost.where("user_id = ?", id)
  end

private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

end
