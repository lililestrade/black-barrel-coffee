class ProductiveCountry < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :country
  belongs_to :variety, inverse_of: :productive_countries

  accepts_nested_attributes_for :country

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :address ],
    associated_against: {
      variety: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
