class User < ApplicationRecord
    has_many :books
    has_many :reviews
    has_many :books, through: :reviews

    validates :username, uniqueness: true, presence: true 


    has_secure_password

end
