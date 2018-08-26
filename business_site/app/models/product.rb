class Product
  require 'csv'
  attr_accessor :pid, :item, :description, :price, :condition, :dimension_w,
                :dimension_l, :dimension_h, :img_file, :quantity, :category,
                :data, :product_box, :products
  def initialize
    @product = Product.new
    @pdata = []
  end
  def clearance
  end
  def create
  end
  def data
    CSV.foreach 'lib/assets/faust_inventory.csv',
                headers: true, header_converters: :symbol do |row|
      @product.pid = row.to_h[:pid]
      @product.item = row.to_h[:item]
      @product.description = row.to_h[:description]
      @product.price = row.to_h[:price]
      @product.condition = row.to_h[:condition]
      @product.dimension_w = row.to_h[:dimension_w]
      @product.dimension_l = row.to_h[:dimension_l]
      @product.dimension_h = row.to_h[:dimension_h]
      @product.img_file = row.to_h[:img_file]
      @product.quantity = row.to_h[:quantity]
      @product.category = row.to_h[:category]
      @pdata << product
    end
  end
end