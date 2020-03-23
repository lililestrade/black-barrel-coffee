class Month < ApplicationRecord
  has_many :harvest_periods

  validates :name, presence: true
end
