class Animal < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo
  validates :name, :gender, :size, :specie, :description, presence: true
end
