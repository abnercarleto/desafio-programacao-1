class AddColumnImportUuidToSellItems < ActiveRecord::Migration
  def change
    add_column :sell_items, :import_uuid, :text
    add_index :sell_items, :import_uuid
  end
end
