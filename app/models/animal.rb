class Animal < ApplicationRecord
  has_many :sightings

  validates :common_name, :latin_latin, presence: true

  validates :latin_latin
end
