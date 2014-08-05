class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable
  
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :restaurants

  validates_presence_of :first_name, :last_name, :username, :encrypted_password
  validates_uniqueness_of :username
end
