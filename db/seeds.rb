
meals =
[
  {
    :name=>"Overnight Oats"
    :protein=>27
    :carbohydrates=>43
    :fats=>13
    :servings_count=>1
    :liquid_only=>false
    :hot_food=>false
    :has_vegetables=>false
    :max_per_week=>7
    :max_per_day=>1
  },
  {
    :name=>"Greek Yogurt"
    :protein=>24
    :carbohydrates=>9
    :fats=>0
    :servings_count=>1
    :liquid_only=>false
    :hot_food=>false
    :has_vegetables=>false
    :max_per_week=>7
    :max_per_day=>1
  },
  {
    :name=>"Protein Pancakes + Yogurt"
    :protein=>52
    :carbohydrates=>69
    :fats=>4
    :servings_count=>1
    :liquid_only=>false
    :hot_food=>true
    :has_vegetables=>false
    :max_per_week=>7
    :max_per_day=>1
  },
  {
    :name=>"Mac and Cheese"
    :protein=>44
    :carbohydrates=>53
    :fats=>13
    :servings_count=>1
    :liquid_only=>false
    :hot_food=>true
    :has_vegetables=>true
    :max_per_week=>7
    :max_per_day=>1
  },
  {
    :name=>"Veggie Smoothie"
    :protein=>61
    :carbohydrates=>62
    :fats=>2
    :servings_count=>1
    :liquid_only=>true
    :hot_food=>false
    :has_vegetables=>true
    :max_per_week=>7
    :max_per_day=>1
  },
  {
    :name=>"Olive Tampanade salad"
    :protein=>12
    :carbohydrates=>10
    :fats=>12
    :servings_count=>1
    :liquid_only=>false
    :hot_food=>false
    :has_vegetables=>true
    :max_per_week=>7
    :max_per_day=>1
  },
  {
    :name=>"Bag of Veggies"
    :protein=>0
    :carbohydrates=>18
    :fats=>0
    :servings_count=>1
    :liquid_only=>false
    :hot_food=>false
    :has_vegetables=>true
    :max_per_week=>7
    :max_per_day=>1
  },
  {
    :name=>"Pb2 Protein Shake"
    :protein=>25
    :carbohydrates=>23
    :fats=>4
    :servings_count=>1
    :liquid_only=>true
    :hot_food=>false
    :has_vegetables=>false
    :max_per_week=>7
    :max_per_day=>1
  },
  {
    :name=>"Whey Protein Shake"
    :protein=>33
    :carbohydrates=>16
    :fats=>1
    :servings_count=>1
    :liquid_only=>true
    :hot_food=>false
    :has_vegetables=>false
    :max_per_week=>7
    :max_per_day=>1
  },
  {
    :name=>"Cauliflower pizza"
    :protein=>48
    :carbohydrates=>108
    :fats=>32
    :servings_count=>1
    :liquid_only=>false
    :hot_food=>true
    :has_vegetables=>false
    :max_per_week=>7
    :max_per_day=>1
  },
]

meals.each do |meal_hash|
  Meal.create!(meal_hash)
end

user = User.create(
  email: 'neeraj.kapoor@learntobe.org',
  password: 'learntobe',
  protein: 160,
  carbohydrates: 180,
  fats: 38,
  macro_tolerance: 10
)
