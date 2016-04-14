class Summary
  attr_reader :import_uuid, :sell_items
  def initialize(import_uuid)
    @import_uuid = import_uuid
    @sell_items = SellItem.all_realized_by_uuid(import_uuid)
  end

  def total
    @total ||= @sell_items.map do |item|
      item.purchase_count * item.product.price
    end.reduce(&:+)
  end
end
