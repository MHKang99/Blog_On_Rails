class User < ApplicationRecord
    has_secure_password

    has_many :comments, dependent: :destroy
    has_many :posts, dependent: :destroy
    # must have validation for email format ask TA
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: {minimum: 3}
end
