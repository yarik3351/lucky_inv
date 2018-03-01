class User < ApplicationRecord
  has_many :invoices
  validates :email, :email_format => { :message => 'is not looking good' },
             presence: true
  validates :name, presence: true
  has_secure_password
end
