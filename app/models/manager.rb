class Manager < ApplicationRecord
  REGIONS = %w[
    east
    west
    south
    north
  ].freeze

  belongs_to :user, inverse_of: :manager
  has_many :comments, inverse_of: :manager, dependent: :destroy

  validates :first_name, :last_name, :region, presence: true
  validates :region, inclusion: { in: REGIONS }

  def full_name
    "#{first_name} #{last_name}".squish
  end
end
