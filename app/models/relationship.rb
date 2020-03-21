class Relationship < ApplicationRecord
  has_many :varieties

  validates :adult_1_id, presence: true
  validates :kid_id, presence: true
end
