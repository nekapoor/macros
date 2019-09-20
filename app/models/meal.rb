class Meal < ApplicationRecord
  PROTEIN_CALS = 4
  CARB_CALS = 4
  FAT_CALS = 9

  belongs_to :user

  def self.calories_for(meals)
    meals.sum(:protein) * PROTEIN_CALS + meals.sum(:carbohydrates) * CARB_CALS + meals.sum(:fats) * FAT_CALS
  end

end
