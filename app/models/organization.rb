class Organization < ApplicationRecord
  has_many :donations
  has_many :users, through: :donations
  scope :recent, -> { order(date: :desc) }
  validates :name, presence: true, uniqueness: true


end
