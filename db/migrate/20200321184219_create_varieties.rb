class CreateVarieties < ActiveRecord::Migration[5.2]
  def change
    create_table :varieties do |t|
      t.string :name, null: false
      t.string :country
      t.integer :altitude
      t.references :relationship, foreign_key: true
      t.references :mutation, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
