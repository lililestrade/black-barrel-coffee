class AddCoordinatesToProductiveCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :productive_countries, :latitude, :float
    add_column :productive_countries, :longitude, :float
  end
end
