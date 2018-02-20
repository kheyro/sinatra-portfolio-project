class User < ActiveRecord::Base
  has_many :recipes
  has_many :ingredients, through: :recipes
  validates :username, presence: true
  has_secure_password
end