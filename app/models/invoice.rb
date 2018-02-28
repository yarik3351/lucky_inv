class Invoice < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?
# The set_defaults will only work if the object is new

  enum status: {fresh: 'Fresh', issued: 'Issued', paid: 'Paid', cancelled: 'Cancelled'}
  enum currency: {USD: 'USD', EUR: 'EUR', RUB: 'RUB', UAH: 'UAH'}

def set_defaults
  self.number  ||= Date.today.strftime("%d %m %y").gsub(/\s+/, "").to_s + '-' + (Invoice.last.id + 1).to_s
  #self.currency ||= Invoice.currencies.keys[0]
  #self.status ||= Invoice.statuses.keys[0]
end

#belong_to :user, belong_to :customer
    # validates :name, presence: true
    # validates :email, presence: true
    # validates :email, presence: true
    # has_secure_password
end
