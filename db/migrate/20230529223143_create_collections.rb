class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.timestamp :time
      t.date :date
      t.string :note
      t.integer :quantity
      t.float :buckets
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
