class SellItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :merchant
  belongs_to :purchaser

  scope :all_realized, -> { includes(:purchaser, :product, :merchant) }
end
