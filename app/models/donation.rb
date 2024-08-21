class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  validates :amount, presence: true
  scope :recent, -> { order(date: :desc) }
  accepts_nested_attributes_for :organization, reject_if: :all_blank

end
