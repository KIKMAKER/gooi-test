class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.timestamp :time
      t.date :date
      t.string :note
      t.integer :bucket_quantity
      t.string :bucket_type
      t.references :order, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
