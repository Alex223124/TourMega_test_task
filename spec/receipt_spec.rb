describe "receipt" do

  describe "#initialize" do

    context "when the correct items are specified" do

      correct_item = ["1", "book", "at", "12.49"]
      items = Product.new(correct_item)
      sales_tax = 0.0
      total_all = 12.49
      receipt = Receipt.new(items, sales_tax, total_all)

      good = false
      good_tax = 0.0
      import = false
      import_tax = 0.0
      name = "book"
      price = 12.49
      purchase_price = 12.49
      quantity = 1
      sales_tax = 0.0
      total_purchase_price = 12.49
      total_sales_tax = 0.0
      total_all = 12.49

      it "should set instance varialbes with correct values" do
        expect(receipt.instance_variable_get("@items").good).to eql(good)
        expect(receipt.instance_variable_get("@items").good_tax).to eql(good_tax)
        expect(receipt.instance_variable_get("@items").import).to eql(import)
        expect(receipt.instance_variable_get("@items").import_tax).to eql(import_tax)
        expect(receipt.instance_variable_get("@items").name).to eql(name)
        expect(receipt.instance_variable_get("@items").price).to eql(price)
        expect(receipt.instance_variable_get("@items").purchase_price).to eql(purchase_price)
        expect(receipt.instance_variable_get("@items").quantity).to eql(quantity)
        expect(receipt.instance_variable_get("@items").sales_tax).to eql(sales_tax)
        expect(receipt.instance_variable_get("@items").total_purchase_price).to eql(total_purchase_price)

        expect(receipt.instance_variable_get("@sales_tax")).to eql(total_sales_tax)
        expect(receipt.instance_variable_get("@total_all")).to eql(total_all)
        expect(receipt.instance_variable_get("@content")).to eql([])
      end

    end

    context "when input is not specified " do

      it "should raise an error" do
        expect{ Receipt.new(nil) }.to raise_error
      end

    end

    context "when input is blank" do

      it "should raise an error" do
        expect{ Receipt.new("") }.to raise_error
      end

    end

  end

  describe "#generate_content" do

    context "when the correct items are specified" do

      first_item = ["1", "book", "at", "12.49"]
      second_item = ["1", "chocolate", "bar", "at", "0.85"]
      first_product = Product.new(first_item)
      second_product = Product.new(second_item)

      items = [first_product, second_product]
      sales_tax = 0.0
      total_all = 12.49
      receipt = Receipt.new(items, sales_tax, total_all)
      content = ["1 book: 12.49", "1 chocolate bar: 0.85", "Sales Total: 0.00", "Total: 12.49"]

      it "should generate content" do
       expect(receipt.generate_content).to eql(content)
      end

    end

    context "when the incorrect items are specified" do
      items = [nil, "adadsasdsad"]
      sales_tax = 0.0
      total_all = 12.49
      receipt = Receipt.new(items, sales_tax, total_all)

      it "should raise an error" do
        expect{ receipt.generate_content }.to raise_error
      end

    end

  end

  describe "#format_items" do

    context "when the correct items are specified" do

      first_item = ["1", "book", "at", "12.49"]
      second_item = ["1", "chocolate", "bar", "at", "0.85"]
      first_product = Product.new(first_item)
      second_product = Product.new(second_item)
      items = [first_product, second_product]

      receipt = Receipt.allocate
      receipt.instance_variable_set("@content", [])
      receipt.send(:format_items, items)
      correct_value = ["1 book: 12.49", "1 chocolate bar: 0.85"]

      it "should set instance varialbe @content with correct value" do
        expect(receipt.instance_variable_get("@content")).to eql(correct_value)
      end

    end

    context "when the incorrect items are specified" do

      items = [0, nil]
      receipt = Receipt.allocate
      receipt.instance_variable_set("@content", [])

      it "should set instance varialbes with correct values" do
        expect{ receipt.send(:format_items, items) }.to raise_error
      end

    end

  end

  describe "#format_totals" do

    context "when the correct arguments are specified" do

      receipt = Receipt.allocate
      receipt.instance_variable_set("@content", [])
      sales_tax = 1.5
      total_all = 29.83
      receipt.send(:format_totals, sales_tax, total_all)
      correct_value = ["Sales Total: 1.50", "Total: 29.83"]

      it "should add sales total and total values to @content variable" do
        expect(receipt.instance_variable_get("@content")).to eql(correct_value)
      end

    end

    context "when the incorrect argument are specified" do

      receipt = Receipt.allocate
      receipt.instance_variable_set("@content", [])
      sales_tax = nil
      total_all = "sadsadsad"

      it "should set instance varialbes with correct values" do
        expect{ receipt.send(:format_totals, sales_tax, total_all) }.to raise_error
      end

    end

  end

end