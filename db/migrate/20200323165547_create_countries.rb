class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :annual_prod
      t.integer :world_rank
      t.string :world_market_share
      t.text :description

      t.timestamps
    end
  end
end
