class Animal < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many_attached :photos
  validates :name, :gender, :size, :specie, :description, presence: true
end
