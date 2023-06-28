class CreateCollectionRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_records do |t|
      t.timestamp :time
      t.text :note
      t.integer :quantity
      t.string :bucket_type
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
