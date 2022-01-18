class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name, index: { unique: true }
      t.integer :base_experience
      t.integer :height
      t.boolean :is_default, default: false
      t.integer :order
      t.integer :weight
      t.string :location_area_encounters

      t.timestamps
    end
  end
end
