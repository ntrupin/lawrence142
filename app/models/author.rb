class Author < ApplicationRecord
  has_and_belongs_to_many :articles, join_table: :collaborations

  validates :firstname, presence: true
  validates :lastname, presence: true

  def fullname
    "#{firstname} #{lastname}"
  end
end
