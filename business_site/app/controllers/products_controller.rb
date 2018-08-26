# frozen_string_literal: true

require 'csv'

class ProductsController < ApplicationController
  def home; end

  def index
    @products = data
  end
  def show
  end

  private

  def data
    product_array = []
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
      product_array << product
    end
    return product_array
  end
end
