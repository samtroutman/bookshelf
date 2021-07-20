class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  def self.alpha
    order(:title)
  end
  
  def genre_attributes=(attributes)
    self.genre = Genre.find_or_create_by(attributes) if !attributes['name'].empty?
    self.genre
  end



end
