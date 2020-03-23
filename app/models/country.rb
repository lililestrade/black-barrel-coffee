class Country < ApplicationRecord
  has_many :country_process_links
  has_many :harvest_periods
  has_many :productive_countries

  validates :name, presence: true

end
