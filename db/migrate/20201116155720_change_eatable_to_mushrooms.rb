class ChangeEatableToMushrooms < ActiveRecord::Migration[6.0]
  def change
    change_column :mushrooms, :eatable, :boolean, default: false
  end
end
