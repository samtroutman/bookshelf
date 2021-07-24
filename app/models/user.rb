class User < ApplicationRecord
    has_many :reviews
    has_many :books, through: :reviews

    validates :username, uniqueness: true, presence: true 

    has_secure_password

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.password = SecureRandom.hex(15)
        end
    end

end
