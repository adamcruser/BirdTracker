class Bird < ApplicationRecord
    has_many :sightings
    validates :name, :species, :color, presence: true
    validates :name, uniqueness:true
end
