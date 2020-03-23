class CountryProcessLink < ApplicationRecord
  belongs_to :country
  belongs_to :drying_process
end
