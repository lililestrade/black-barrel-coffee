class CreateProductiveCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :productive_countries do |t|
      t.references :variety, foreign_key: true
      t.references :country, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
