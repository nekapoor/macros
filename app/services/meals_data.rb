class MealsData
  attr_reader :meals, :protein, :carbs, :fats

  PROTEIN_CALS = 4
  CARB_CALS = 4
  FAT_CALS = 9

  def initialize(meals)
    @meals = meals
  end

  def protein
    @protein ||= meals.sum(:protein)
  end

  def carbs
    @carbs ||= meals.sum(:carbohydrates)
  end

  def fats
    @fats ||= meals.sum(:fats)
  end

  def total_calories
    (protein * PROTEIN_CALS) + (carbs * CARB_CALS) + (fats * FAT_CALS)
  end

  def within_range?(lower, upper)
    lower >= total_calories && total_calories <= upper
  end
end
