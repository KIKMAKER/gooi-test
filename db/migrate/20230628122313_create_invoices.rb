class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.date :date
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
