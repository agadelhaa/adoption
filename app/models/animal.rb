class Animal < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many_attached :photos
  validates :name, :gender, :size, :specie, :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

