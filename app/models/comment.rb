# Notes by managers about Products and Categories
class Comment < ApplicationRecord
  belongs_to :manager, inverse_of: :comments
  belongs_to :topic, polymorphic: true, inverse_of: :comments

  validates :content, presence: true
end
