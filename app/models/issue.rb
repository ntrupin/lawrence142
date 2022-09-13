class Issue < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  has_one_attached :pdf
end
