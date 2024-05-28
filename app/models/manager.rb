class Manager < ApplicationRecord
  REGIONS = %w[
    east
    west
    south
    north
  ].freeze

  belongs_to :user, inverse_of: :manager

  validates :first_name, :last_name, :region, presence: true
  validates :region, inclusion: { in: REGIONS }
end
