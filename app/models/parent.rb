class Parent < ApplicationRecord
  belongs_to :variety, inverse_of: :parents
  # has_many_and_belongs_to :varieties, inverse_of: :parents
end
