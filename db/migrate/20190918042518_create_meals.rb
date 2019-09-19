class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.integer :protein
      t.integer :carbohydrates
      t.integer :fats
      t.integer :servings_count
      t.boolean :liquid_only
      t.boolean :hot_food
      t.boolean :has_vegetables
      t.integer :max_per_week
      t.integer :max_per_day
    end
  end
end
