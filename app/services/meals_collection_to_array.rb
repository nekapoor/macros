class MealsCollectionToArray
  attr_reader :meals

  def initialize(meals)
    @meals = meals
  end

  def convert
    return [] if meals.blank?
    return meals if meals.is_a?(Array)
    return [meals] if meals.is_a?(ActiveRecord::Base)
    return meals.to_a if meals.is_a?(ActiveRecord::Associations::CollectionProxy)

    meals
  end
end
