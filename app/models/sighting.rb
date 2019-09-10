class Sighting < ApplicationRecord
    belongs_to :bird
    validates :date, presence: true
    validates :name, uniqueness: true
end
