describe "purchase" do

  describe "#initialize" do

    context "when the correct items are specified" do

      correct_items = ["1 book at 12.49\n"]
      purchase = Purchase.new(correct_items)
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
        expect(purchase.items[0].good).to eql(good)
        expect(purchase.items[0].good_tax).to eql(good_tax)
        expect(purchase.items[0].import).to eql(import)
        expect(purchase.items[0].import_tax).to eql(import_tax)
        expect(purchase.items[0].name).to eql(name)
        expect(purchase.items[0].price).to eql(price)
        expect(purchase.items[0].purchase_price).to eql(purchase_price)
        expect(purchase.items[0].quantity).to eql(quantity)
        expect(purchase.items[0].sales_tax).to eql(sales_tax)
        expect(purchase.items[0].total_purchase_price).to eql(total_purchase_price)
        expect(purchase.instance_variable_get("@sales_tax")).to eql(total_sales_tax)
        expect(purchase.instance_variable_get("@total_all")).to eql(total_all)
      end

    end

    context "when the incorrect items are specified" do

      incorrect_items = ["adsasd", "aaasdasdas", "asdasda", "124142142124"]

      it "should raise an error" do
        expect{ Purchase.new(incorrect_items) }.to raise_error
      end

    end

    context "when input is not specified " do

      it "should raise an error" do
        expect{ Purchase.new(nil) }.to raise_error
      end

    end

    context "when input is blank" do

      it "should raise an error" do
        expect{ Purchase.new("") }.to raise_error
      end

    end

  end

  describe "#parse_items" do

    context "when the correct items are specified" do

      correct_items = ["1 book at 12.49\n", "1 music CD at 14.99\n", "1 chocolate bar at 0.85"]

      purchase = Purchase.allocate
      purchase.instance_variable_set("@items", [])
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

      it "should set instance varialbes with correct values" do
        purchase.send(:parse_items, correct_items)
        expect(purchase.items[0].good).to eql(good)
        expect(purchase.items[0].good_tax).to eql(good_tax)
        expect(purchase.items[0].import).to eql(import)
        expect(purchase.items[0].import_tax).to eql(import_tax)
        expect(purchase.items[0].name).to eql(name)
        expect(purchase.items[0].price).to eql(price)
        expect(purchase.items[0].purchase_price).to eql(purchase_price)
        expect(purchase.items[0].quantity).to eql(quantity)
        expect(purchase.items[0].sales_tax).to eql(sales_tax)
        expect(purchase.items[0].total_purchase_price).to eql(total_purchase_price)
      end

    end

    context "when the incorrect items are specified" do

      purchase = Purchase.allocate
      incorrect_items = ["adsasd", "aaasdasdas", "asdasda", nil]

      it "should raise an error" do
        expect{ purchase.send(:parse_items, incorrect_items) }.to raise_error
      end

    end

    context "when input is not specified " do

      purchase = Purchase.allocate

      it "should raise an error" do
        expect{ purchase.send(:parse_items, nil) }.to raise_error
      end

    end

    context "when input is blank" do

      purchase = Purchase.allocate

      it "should raise an error" do
        expect{ purchase.send(:parse_items, "") }.to raise_error
      end

    end

  end

  describe "#split_list_of" do

    context "when the correct items are specified" do

      purchase = Purchase.allocate
      correct_items = ["1 book at 12.49\n", "1 music CD at 14.99\n", "1 chocolate bar at 0.85"]
      result = [["1", "book", "at", "12.49"], ["1", "music", "cd", "at", "14.99"], ["1", "chocolate", "bar", "at", "0.85"]]

      it "should split list of items and downcase them" do
        expect(purchase.send(:split_list_of, correct_items)).to eql(result)
      end

    end

    context "when the incorrect items are specified" do

      purchase = Purchase.allocate
      incorrect_items = ["asdadsadasd", "sdasdasdasd", nil]

      it "should split list of items and downcase them" do
        expect { purchase.send(:split_list_of, incorrect_items) }.to raise_error
      end

    end

    context "when input is not specified " do

      it "should raise an error" do
        expect{ Purchase.new(nil) }.to raise_error
      end

    end

    context "when input is blank" do

      it "should raise an error" do
        expect{ Purchase.new("") }.to raise_error
      end

    end

  end

end