class HarvestPeriod < ApplicationRecord
  belongs_to :country, inverse_of: :harvest_periods
  belongs_to :month

end
