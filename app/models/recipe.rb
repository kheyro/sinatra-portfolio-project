class Recipe < ActiveRecord::Base
  belongs_to  :user
  has_many  :quantities, :dependent => :destroy
  has_many  :ingredients, through: :quantities
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end