class Country < ApplicationRecord
  has_many :productive_countries
  has_many :harvest_periods, inverse_of: :country
  has_many :country_process_links, inverse_of: :country

  validates :name, presence: true

  accepts_nested_attributes_for :harvest_periods,
                                reject_if: proc { |attributes| attributes[:month_id].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :country_process_links,
                                reject_if: proc { |attributes| attributes[:drying_process_id].blank? },
                                allow_destroy: true

end
