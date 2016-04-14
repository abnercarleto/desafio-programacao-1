class Product < ActiveRecord::Base
  validates :description, uniqueness: { case_sensitive: false }
end
