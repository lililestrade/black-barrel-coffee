class ProductiveCountry < ApplicationRecord
  belongs_to :country
  belongs_to :variety, inverse_of: :productive_countries

  accepts_nested_attributes_for :country
end
