class CreateMushrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :mushrooms do |t|
      t.string :name
      t.text :content
      t.string :location
      t.boolean :eatable
      t.string :cap

      t.timestamps
    end
  end
end
