class Book < ApplicationRecord
  belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews


  validates :title, presence: true, uniqueness: true 
  validates :author, presence: true

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(rating) desc')}

  scope :order_by_reviews, -> {left_joins(:reviews).group(:book_id).order('count(reviews.id) desc').limit(1)}


  def self.alpha
    order(:title)
  end

  def average
    self.reviews.average(:rating).to_f.round(2)
  end
  
  def genre_attributes=(attributes)
    self.genre = Genre.find_or_create_by(attributes) if !attributes['name'].empty?
    self.genre
  end

end
