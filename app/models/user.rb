class User < ApplicationRecord
  has_many :invoices
  validates :email, :email_format => { :message => 'is not looking good' },
             presence: true,
             length: { maximum: 255 }
  validates :name,  presence: true, length: { maximum: 50 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 1 }# minimum 6 ?
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
