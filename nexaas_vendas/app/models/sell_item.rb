class SellItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :merchant
  belongs_to :purchaser
end
