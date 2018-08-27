# frozen_string_literal: true

require 'csv'

class ProductsController < ApplicationController
  def home; end

  def index
    @products = data
    @price = clearance
  end
  def show
  end

  private

  def data
    @product_array = []
    CSV.foreach 'lib/assets/faust_inventory.csv',
                headers: true, header_converters: :symbol do |row|
      product = Product.new
      product.pid = row.to_h[:pid]
      product.item = row.to_h[:item]
      product.description = row.to_h[:description]
      product.price = row.to_h[:price]
      product.condition = row.to_h[:condition]
      product.dimension_w = row.to_h[:dimension_w]
      product.dimension_l = row.to_h[:dimension_l]
      product.dimension_h = row.to_h[:dimension_h]
      product.img_file = row.to_h[:img_file]
      product.quantity = row.to_h[:quantity]
      product.category = row.to_h[:category]
      @product_array << product if product.quantity.to_i.positive?
    end
  @product_array
  end
  def clearance
    @product_array.each do |product|
      if product.condition == 'good'
        product.price = "#{(product.price.to_i - (product.price.to_i * 0.1))}
        On Sale! 10% off"
      elsif product.condition == 'average'
        product.price = "#{(product.price.to_i - (product.price.to_i * 0.2))}
        On Sale! 20% off"
      end
    end
  end
end