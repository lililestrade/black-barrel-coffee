class CreateVarieties < ActiveRecord::Migration[5.2]
  def change
    create_table :varieties do |t|
      t.string :name
      t.boolean :arabica, default: false
      t.boolean :robusta, default: false
      t.integer :discover_year
      t.string :origin
      t.string :altitude
      t.references :mutation, foreign_key: true
      t.text :plant
      t.text :strenght
      t.text :cup
      t.text :description

      t.timestamps
    end
  end
end
