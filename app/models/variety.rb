class Variety < ApplicationRecord
  belongs_to :mutation
  has_many :productive_countries, inverse_of: :variety, dependent: :destroy
  has_many :parents, inverse_of: :variety, dependent: :destroy
  # has_and_belongs_to_many :parents, inverse_of: :variety
      # class_name: "Variety",
      # join_table: :parents,
      # foreign_key: :variety_id,
      # association_foreign_key: :parent_variety_id

  validates :name, presence: true

  accepts_nested_attributes_for :parents,
                                reject_if: proc { |attributes| attributes[:parent_variety_id].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :productive_countries,
                                reject_if: proc { |attributes| attributes[:country_id].blank? },
                                allow_destroy: true


end
