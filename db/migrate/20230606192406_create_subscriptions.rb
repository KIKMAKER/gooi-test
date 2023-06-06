class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.integer :pick_ups
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
