class Producer < ApplicationRecord
  has_many :products, inverse_of: :producer, dependent: :destroy
end
