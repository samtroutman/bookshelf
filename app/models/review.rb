class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validates :title, presence: true

  validates :book, uniqueness: { scope: :user, message: "This has already been reviewed by you"  }


end
