class Product < ApplicationRecord
  has_many :ties_to_categories, class_name: 'Ties::ProductCategory', inverse_of: :product, dependent: :destroy
  has_many :categories, through: :ties_to_categories

  validates :name, :price, :stock_quantity, :sku, :weight, :rating, presence: true
  validates :description, length: { in: 15..600 }
  validates :price, numericality: { in: 1..99 }
  validates :stock_quantity, :weight, numericality: { greater_than_or_equal_to: 0 }
  validates :sku, format: { with: /\A\d{4}-.+\z/, message: :must_match_sku_format }
  validates :rating, inclusion: { in: 0..5 }

  validate :validate_clothing_weight

  # valīds produkts
  # Product.new(
  #   name: "Boots",
  #   description: "Sturdy winter boots made from natural leather.",
  #   price: 75.99,
  #   stock_quantity: 0,
  #   sku: "0044-clothing",
  #   weight: 1544,
  #   rating: 4.8,
  # )

  before_validation :normalize_description
  after_create_commit :log_new_product_creation

  private

  def normalize_description
    self.description = description.squish
  end

  def log_new_product_creation
    Logger.new(Rails.root.join('log/product_creation.log'))
          .debug("New Product##{id} '#{name}' created at #{created_at}")
  end

  def validate_clothing_weight
    return unless sku.to_s.match?('clothing')
    return if weight < 1000

    errors.add(:weight, :clothing_too_heavy)
  end
end
