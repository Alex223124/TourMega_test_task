require 'pry'
require './lib/file_input_parser'
require_relative '../lib/purchase'

class CheckPrinter

  def initialize(filename)
    @input = FileInputParser.new(filename)
  end

  def run
    purchase = Purchase.new(@input.items)
    receipt = Receipt.new(purchase.items, purchase.sales_tax, purchase.total_all)
    receipt.generate_content
    print(receipt.content)
  end

  private

  def print(content)
    puts content
  end

end