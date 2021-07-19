class User < ApplicationRecord
    has_many :books
    has_many :reviews
    has_many :books, through: :reviews

end
