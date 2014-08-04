class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :restaurants

  validates_presence_of :first_name, :last_name, :username, :email_address, :password, :password_confirmation
  validates_uniqueness_of :username, :email_address
end
