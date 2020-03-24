class CountryProcessLink < ApplicationRecord
  belongs_to :country, inverse_of: :country_process_links
  belongs_to :drying_process
end
