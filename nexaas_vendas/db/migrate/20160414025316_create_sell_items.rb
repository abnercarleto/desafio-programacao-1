class CreateSellItems < ActiveRecord::Migration
  def change
    create_table :sell_items do |t|
      t.integer :purchase_count
      t.integer :product_id
      t.integer :purchaser_id
      t.integer :merchant_id

      t.timestamps null: false
    end
  end
end
