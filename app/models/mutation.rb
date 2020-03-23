class Mutation < ApplicationRecord
 has_many :varieties

 validates :name, presence: true
end
