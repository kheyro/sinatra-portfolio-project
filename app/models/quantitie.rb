class Quantitie < ActiveRecord::Base
  belongs_to  :recipe
  belongs_to  :ingredient
end