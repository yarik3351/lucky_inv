class SetDefaultsForEnums < ActiveRecord::Migration[5.2]
  def change
    change_column :invoices, :status, :string, default: :fresh
    change_column :invoices, :currency, :string, default: :USD
  end
end
