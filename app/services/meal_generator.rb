class MealGenerator
  attr_reader :protein, :carbohydrates, :fats, :user, :meals, :daily_menu, :options, :meals_array

  PROTEIN_CALS = 4
  CARB_CALS = 4
  FAT_CALS = 9

  def initialize(user, options = {})
    @options = options
    @user = user
    @meals_array = MealsCollectionToArray.new(options[:meals]).convert
    p @meals_array
    @meals = user.meals.to_a - @meals_array
    @daily_menu = []
    set_macros
  end

  def generate
    potential_meals.each do |meals|
      puts lower_calorie_bound
      puts upper_calorie_bound
      puts total_calories
      calories_for_meal = calories_for(meals)
      daily_menu << meals if calories_for_meal >= lower_calorie_bound
    end

    daily_menu
  end

  def calories_for(meals)
    Meal.calories_for(meals)
  end

  def potential_meals
    meal_combos = []

    (1..meals.count).each do |i|
      meals.combination(i).to_a.each do |c|
        meal_combos << c
      end
    end

    meal_combos
  end

  def meal_names
    meals.map(&:name)
  end

  def add_tolerance(amount = 0)
    user.macro_tolerance + amount
  end

  def upper_calorie_bound
    (1 + user.macro_tolerance / 100.0) * total_calories
  end

  def lower_calorie_bound
    (1 - user.macro_tolerance / 100.0) * total_calories
  end

  def within_calorie_range?(lower, upper)
    total_calories >= lower  && total_calories <= upper
  end

  def total_calories
    (protein * PROTEIN_CALS) + (carbohydrates * CARB_CALS) + (fats * FAT_CALS)
  end

  def set_macros
    if meals_array.present?
      meals_params = MealsData.new(meals_array)
      @protein = meals_params.protein
      @carbohydrates = meals_params.carbohydrates
      @fats = meals_params.fats
    else
      @protein = options[:protein] || user.protein
      @carbohydrates = options[:carbohydrates] || user.carbohydrates
      @fats = options[:fats] || user.fats
    end
  end
end

# menus = mg.generate

# menus.each do |t|
#   print t.map { |m| m.name }
# end;nil
