class Sell
  include ActiveModel::Model

  attr_accessor :purchase_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name

  def self.from_file_line(line)
    attrs = line.split("\t")
    Sell.new({
      purchase_name: attrs[0],
      item_description: attrs[1],
      item_price: attrs[2],
      purchase_count: attrs[3],
      merchant_address: attrs[4],
      merchant_name: attrs[5]
    })
  end
end
