class DryingProcess < ApplicationRecord
  has_many :country_process_links

  validates :name, presence: true

end
