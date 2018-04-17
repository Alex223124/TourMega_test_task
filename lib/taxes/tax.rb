class Tax

  NEAREST_CENT = 1 / 0.05

  def self.sum_of_taxes_of_certain_type(goods, type)
    total_values = goods.map { |good| good.public_send(type) }
    total_values.inject(:+).round(2)
  end

  def initialize(status, base_total, tax_rate)
    @status, @base_total, @tax_rate = status, base_total, tax_rate
  end

  def calculate(status = @status, base_total = @base_total, tax_rate = @tax_rate)
    if status
      compute_tax(base_total, tax_rate)
    else
      0.0
    end
  end

  private

  def compute_tax(item_price, tax_rate)
    round_tax(item_price * tax_rate)
  end

  def round_tax(amount)
    ((amount * NEAREST_CENT).ceil / NEAREST_CENT)
  end

end