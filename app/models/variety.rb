class Variety < ApplicationRecord
  belongs_to :mutation
  has_many :productive_countries
end
