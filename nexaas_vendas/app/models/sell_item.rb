class SellItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :merchant
  belongs_to :purchaser

  scope :all_realized, -> { includes(:purchaser, :product, :merchant) }
  scope :all_realized_by_uuid, ->(uuid) { all_realized.where(import_uuid: uuid) }
end
