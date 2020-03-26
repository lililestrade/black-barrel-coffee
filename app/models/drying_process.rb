class DryingProcess < ApplicationRecord
  has_many :country_process_links, dependent: :destroy

  validates :name, presence: true

end
