class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :name_uk
      t.string :address
      t.string :address_uk
      t.string :phone
      t.jsonb :bank_credentials

      t.timestamps
    end
  end
end
