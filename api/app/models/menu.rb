class Menu < ApplicationRecord
  has_many :food_menus
  has_many :foods, through: :food_menus

  def save_and_calculate_alimentation!
    self.calorie = foods.sum(:calorie)
    self.protein = foods.sum(:protein)
    self.fat = foods.sum(:fat)
    self.carbohydrate = foods.sum(:carbohydrate)

    save!
  end
end
