class AddMacrosPerDayToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :protein, :integer
    add_column :users, :carbohydrates, :integer
    add_column :users, :fats, :integer
    add_column :users, :macro_tolerance, :integer
  end
end
