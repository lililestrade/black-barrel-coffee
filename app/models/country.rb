class Country < ApplicationRecord
  has_many :country_process_links
  has_many :harvest_periods

end
