class SellParser
  attr_accessor :tab_file

  def initialize(filename)
    @tab_file = File.open(filename, 'r')
    @lines = @tab_file.readlines
    @sells = []
  end

  def parse
    raise SellParserError.new('Arquivo de vendas nao contem registros!') unless @lines.size > 1

    @lines[1..-1].each do |line|
      @sells << Sell.from_file_line(line)
    end

    @import_uuid = SecureRandom.uuid

    save_sells
  end

  def save_sells
    @sells.each do |sell|
      purchaser = Purchaser.find_or_create_by(name: sell.purchase_name)
      product = Product.find_or_create_by(description: sell.item_description, price: sell.item_price)
      merchant = Merchant.find_or_create_by(name: sell.merchant_name, address: sell.merchant_address)

      sell_item = SellItem.new(purchase_count: sell.purchase_count, import_uuid: @import_uuid)
      sell_item.purchaser = purchaser
      sell_item.product = product
      sell_item.merchant = merchant
      sell_item.save
    end

    @import_uuid
  end

  class SellParserError < StandardError
  end
end
