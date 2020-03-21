class Variety < ApplicationRecord
  belongs_to :mutation
  has_many :relationship

  validates :name, presence: true, uniqueness: true

end
