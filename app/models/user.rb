# A generic representation of someone able to log in, identified by a unique email.
class User < ApplicationRecord
  has_secure_password

  has_one :manager, inverse_of: :user, dependent: :destroy
  has_one :customer, inverse_of: :user, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@]+@[^@]+\.[^@]+\z/ }
end
