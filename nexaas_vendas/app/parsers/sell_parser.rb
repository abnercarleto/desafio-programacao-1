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

    @purchases = purchasers_from_sell(@sells)
    @merchants = merchants_from_sell(@sells)
    @products = products_from_sell(@sells)
  end

  def purchasers_from_sell(sells)
    sells.map(&:purchase_name).uniq.map do |purchase_name|
      Purchaser.find_or_create_by(name: purchase_name)
    end
  end

  def merchants_from_sell(sells)
    sells.map do |sell|
      {
        name: sell.merchant_name,
        address: sell.merchant_address
      }
    end.uniq.map do |merchant|
      Merchant.find_or_create_by(name: merchant[:name], address: merchant[:address])
    end
  end

  def products_from_sell(sells)
    sells.map do |sell|
      {
       description: sell.item_description,
       price: sell.item_price
      }
    end.uniq.map do |product|
      Product.find_or_create_by(description: product[:description], price: product[:price])
    end
  end

  class SellParserError < StandardError
  end
end
