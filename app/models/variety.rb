class Variety < ApplicationRecord
  belongs_to :mutation
  has_many :productive_countries
  has_and_belongs_to_many :parents,
      class_name: "Variety",
      join_table: :parents,
      foreign_key: :variety_id,
      association_foreign_key: :parent_variety_id
end
