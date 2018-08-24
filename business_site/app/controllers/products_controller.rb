class ProductsController < ApplicationController
  def home
  end

  def index
    # this is pseudocode for what to do. Parse through csv and for each row, set eact attribute to the attribute in that row.
    # header could be either a string or symbol
    # @products = CSV.each_row do |row|
    #   Product.new(pid: row[:pid], description: row[:description])
    # end
  end

  def show
  end
end