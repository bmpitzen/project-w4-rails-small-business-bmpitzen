require 'csv'

class ProductsController < ApplicationController
  attr_accessor :product_box
  def home
  end

  def index
  end

  def product_box
    @pinfo = []
    product.pdata.each do |item|
      info = %(
        #{item.item}
        #{item.description} 
        #{item.price}
        )
      @pinfo << info
    end
  end

  def show
  end
end