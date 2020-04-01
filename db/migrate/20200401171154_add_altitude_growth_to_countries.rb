class AddAltitudeGrowthToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :altitude_growth, :string
  end
end
