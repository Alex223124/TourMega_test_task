class Product

  GOOD_TAX_RATE = 0.10
  IMPORT_TAX_RATE = 0.05
  NEAREST_CENT = 1 / 0.05
  EXCLUSIONS = ["book", "chocolates", "chocolate", "pills"]

  attr_accessor :name, :quantity, :price, :good, :import, :purchase_price,
                :good_tax, :import_tax, :sales_tax, :total_purchase_price

  def initialize(item)
    @name = parse_name(item)
    @quantity = parse_quantity(item)
    @price = parse_price(item)
    @good = is_regular?(item)
    @import = is_imported?(item)
    @purchase_price = @quantity * @price

    @good_tax = StandardTax.new(@good, @purchase_price, GOOD_TAX_RATE).calculate
    @import_tax = ImportTax.new(@import, @purchase_price, IMPORT_TAX_RATE).calculate
    @total_purchase_price = (@purchase_price + @good_tax + @import_tax).round(2)

    @sales_tax = @good_tax + @import_tax
  end

  private

  def parse_name(item)
    end_point = (item.index "at") - 1
    item[1..end_point].join(" ")
  end

  def parse_quantity(item)
    item[0].to_i
  end

  def parse_price(item)
    item.last.to_f
  end

  def is_regular?(item)
    (item & EXCLUSIONS).any? ? false : true
  end

  def is_imported?(item)
    item.include? 'imported'
  end

end