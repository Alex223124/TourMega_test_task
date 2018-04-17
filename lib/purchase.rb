class Purchase

  attr_accessor :items, :total_all, :sales_tax

  def initialize(items)
    @items = []
    parse_items(items)
    @total_all = Tax.sum_of_taxes_of_certain_type(@items, 'total_purchase_price')
    @sales_tax = Tax.sum_of_taxes_of_certain_type(@items, 'sales_tax')
  end

  private

  def parse_items(items)
    split_list_of(items).each { |item| @items << Product.new(item) }
  end

  def split_list_of(items)
    items.map! { |item| item.downcase.strip.split(/\s/) }
  end

end