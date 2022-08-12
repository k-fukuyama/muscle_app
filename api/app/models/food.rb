class Food < ApplicationRecord
  has_many :food_menus
  has_many :menus, through: :food_menus
end
