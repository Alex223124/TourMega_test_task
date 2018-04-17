describe "tax" do

  describe "#sum_of_taxes_of_certain_type" do

    context "when the correct arguments are specified" do

      first_item = ["1", "book", "at", "12.49"]
      second_item = ["1", "chocolate", "bar", "at", "0.85"]
      first_product = Product.new(first_item)
      second_product = Product.new(second_item)
      items = [first_product, second_product]
      total_purchase_price = 13.34
      sales_tax = 0.0

      it "should calculate total_purchase_price for collection of products" do
        expect(Tax.sum_of_taxes_of_certain_type(items, "total_purchase_price")).to eql(total_purchase_price)
      end

      it "should calculate sales_tax for collection of products" do
        expect(Tax.sum_of_taxes_of_certain_type(items, "sales_tax")).to eql(sales_tax)
      end

    end

    context "when the incorrect arguments are specified" do

      items = [nil, 1111]

      it "should raise an error" do
        expect { Tax.sum_of_taxes_of_certain_type(items, "total_purchase_price") }.to raise_error
      end

      it "should raise an error" do
        expect { Tax.sum_of_taxes_of_certain_type(items, "sales_tax") }.to raise_error
      end

    end

  end

  describe "#calculate" do

    tax = Tax.allocate

    it "should use calculate_tax method if status is set to true" do
      expect(tax.calculate(true, 1, 1)).to eql(1.0)
    end

    it "should retrun 0.0 if status is set to false" do
      expect(tax.calculate(false, 1, 1)).to eql(0.0)
    end

  end

  describe "#compute_tax" do

    tax = Tax.allocate

    it "should calculate tax for current item" do
      expect(tax.send(:compute_tax, 14.99, 0.1)).to eql(1.5)
    end

  end

  describe "#round_tax" do

    tax = Tax.allocate

    it "should round amount of tax up to a tenth part" do
      expect(tax.send(:round_tax,1.499)).to eql(1.5)
    end

  end

end