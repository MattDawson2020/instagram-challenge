class User < ApplicationRecord

  has_secure_password 
  has_one_attached :image
  has_many :jams
  has_many :comments

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, format: { with: VALID_EMAIL_REGEX}
  validates :password, length: { minimum: 6, maximum: 20}
  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end
end
