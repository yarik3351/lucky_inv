class Invoice < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?
# The set_defaults will only work if the object is login

  enum status: {fresh: 'Fresh', issued: 'Issued', paid: 'Paid', cancelled: 'Cancelled'}
  enum currency: {USD: 'USD', EUR: 'EUR', RUB: 'RUB', UAH: 'UAH'}

def set_defaults
    self.number  ||= Date.today.strftime("%d %m %y").gsub(/\s+/, "").to_s + '-' + (Invoice.last.id + 1).to_s
end

belongs_to :user
belongs_to :customer
    #validates :name, presence: true
self.per_page = 10

end
