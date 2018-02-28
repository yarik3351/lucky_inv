class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :number
      t.date :date
      t.integer :user_id
      t.integer :customer_id
      t.text :saved_user
      t.text :saved_customer
      t.text :saved_bank_credentials
      t.string :status
      t.decimal :amount, precision: 9, scale: 2
      t.string :currency
      t.jsonb :items

      t.timestamps
    end
  end
end
