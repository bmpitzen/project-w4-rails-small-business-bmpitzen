class Product
  require 'csv'
  attr_accessor :pid, :item, :description, :price, :condition, :dimension_w,
                :dimension_l, :dimension_h, :img_file, :quantity, :category,
                :product_box, :products
  def initialize
  end
end