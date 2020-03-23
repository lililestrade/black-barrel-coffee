class CreateHarvestPeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :harvest_periods do |t|
      t.references :country, foreign_key: true
      t.references :month, foreign_key: true

      t.timestamps
    end
  end
end
