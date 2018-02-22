class User < ActiveRecord::Base
  has_many :recipes
  has_many :ingredients, through: :recipes
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
end