class Receipt

  attr_reader :content

  def initialize(items, sales_tax, total_all)
    @items = items
    @sales_tax = sales_tax
    @total_all = total_all
    @content = []
  end

  def generate_content
    format_items(@items)
    format_totals(@sales_tax, @total_all)
  end

  private

  def format_items(items)
    items.each do |item|
      @content << "#{item.quantity} #{item.name}: #{"%.2f" % item.total_purchase_price}"
    end
  end

  def format_totals(sales_tax, total_all)
    @content << "Sales Total: #{"%.2f" % sales_tax}"
    @content << "Total: #{"%.2f" % total_all}"
  end

end