class News < ApplicationRecord
  belongs_to :user

  scope :latest, ->(n) { order('created_at DESC').limit(n) }
end
