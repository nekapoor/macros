class MealGenerator
  attr_reader :protein, :carbohydrates, :fats, :users, :meals, :daily_menu

  PROTEIN_CALS = 4
  CARB_CALS = 4
  FAT_CALS = 9

  def initialize(user, options)
    @options = options
    @user = user
    @meals = user.meals.to_a
    @daily_menu = []
    set_macros
  end

  def generate
    potential_meals.each do |meals|
      meals_data = MealsData.new(meals)
      daily_menu << meals if meals_data.within_range?(lower_calorie_bound, upper_calorie_bound)
    end

    daily_menu
  end

  def potential_meals
    meal_combos = []

    (1..meals.count).each do |i|
      meal_names.combination(i).to_a.each do |c|
        meal_combos << c
      end
    end

    meal_combos
  end

  def meal_names
    meals.map(&:name)
  end

  def upper_calorie_bound
    (1 + user.macro_tolerance / 100.0) * total_calories
  end

  def lower_calorie_bound
    (1 - user.macro_tolerance / 100.0) * total_calories
  end

  def total_calories
    (user.protein * PROTEIN_CALS) + (user.carbohydrates * CARB_CALS) + (user.fats * FAT_CALS)
  end

  def set_macros
    raise 'Must send a meal or macros to build from' unless options[:meal].present? || (options[:protein] && options[:carbohydrates] && options[:fats])

    if options[:meal].present?
      meal = options[:meal]
      @protein = meal.protein
      @carbohydrates = meal.carbohydrates
      @fats = meal.fats
    else
      @protein = options[:protein]
      @carbohydrates = options[:carbohydrates]
      @fats = options[:fats]
    end
  end

end
