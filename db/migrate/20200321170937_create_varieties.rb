class CreateVarieties < ActiveRecord::Migration[5.2]
  def change
    create_table :varieties do |t|
      t.string :name
      t.string :country
      t.integer :altitude
      t.bigint :parent_1_id
      t.bigint :parent_2_id
      t.bigint :parent_3_id
      t.references :mutation, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
