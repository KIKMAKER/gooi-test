class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :product
      t.integer :quantity
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
