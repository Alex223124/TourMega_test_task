describe "product" do

  describe "#initialize" do

    context "when input is correct" do

      item = ["1", "book", "at", "12.49"]
      product = Product.new(item)
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
        expect(product.instance_variable_get("@good")).to eql(good)
        expect(product.instance_variable_get("@good_tax")).to eql(good_tax)
        expect(product.instance_variable_get("@import")).to eql(import)
        expect(product.instance_variable_get("@import_tax")).to eql(import_tax)
        expect(product.instance_variable_get("@name")).to eql(name)
        expect(product.instance_variable_get("@price")).to eql(price)
        expect(product.instance_variable_get("@purchase_price")).to eql(purchase_price)
        expect(product.instance_variable_get("@quantity")).to eql(quantity)
        expect(product.instance_variable_get("@sales_tax")).to eql(sales_tax)
        expect(product.instance_variable_get("@total_purchase_price")).to eql(total_purchase_price)
      end

    end

    context "when input is incorrect" do

      incorrect_item = ["adsasd", "aaasdasdas", "asdasda", "124142142124"]

      it "should raise an error" do
        expect{ Product.new(incorrect_item) }.to raise_error
      end

    end

    context "when input is not specified " do

      it "should raise an error" do
        expect { Product.new(nil) }.to raise_error
      end

    end

    context "when input is blank" do

      it "should raise an error" do
        expect { Product.new("") }.to raise_error
      end

    end

  end

  describe "#parse_name" do

    context "when input is correct" do

      item = ["1", "book", "at", "12.49"]
      product = Product.allocate
      product_name = "book"

      it "should get name of product from an array" do
        expect(product.send(:parse_name, item)).to eql(product_name)
      end

    end

    context "when input is incorrect" do

      item = ["afsasfaf", "asfafafs", "asfafasfafs", nil]
      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:parse_name, item) }.to raise_error
      end

    end

    context "when input is not specified " do

      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:parse_name, nil) }.to raise_error
      end

    end

    context "when input is blank" do

      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:parse_name, "") }.to raise_error
      end

    end

  end

  describe "#parse_quantity" do

    context "when input is correct" do

      item = ["1", "book", "at", "12.49"]
      product = Product.allocate
      product_qunatity = 1

      it "should get product quantity from an array and convert in to integer" do
        expect(product.send(:parse_quantity, item)).to eql(product_qunatity)
      end

    end

    context "when input is incorrect" do

      item = ["afsasfaf", "asfafafs", "asfafasfafs", "fafasfasfasfasfasf"]
      product = Product.allocate

      it "should produce 0" do
        expect(product.send(:parse_quantity, item)).to eql(0)
      end

    end

    context "when input is not specified " do

      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:parse_quantity, nil) }.to raise_error
      end

    end

    context "when input is blank" do

      product = Product.allocate

      it "should produce 0" do
        expect(product.send(:parse_quantity, "")).to eql(0)
      end

    end

  end

  describe "#parse_price" do

    context "when input is correct" do

      item = ["1", "book", "at", "12.49"]
      product = Product.allocate
      price = 12.49

      it "should get last item from array and covenr it to fixnum" do
        expect(product.send(:parse_price, item)).to eql(price)
      end

    end

    context "when input is incorrect" do

      incorrect_item = ["adsasd", "aaasdasdas", "asdasda", "sfasfasfasf"]
      product = Product.allocate
      price = 0.0

      it "should produce 0.0" do
        expect(product.send(:parse_price, incorrect_item)).to eql(price)
      end

    end

    context "when input is not specified" do

      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:parse_price, nil) }.to raise_error
      end

    end

    context "when input is blank" do

      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:parse_price, "") }.to raise_error
      end

    end

  end

  describe "#is_regular?" do

    context "when input is correct" do

      item_which_not_in_exception = ["1", "music", "CD", "at", "14.99"]
      product = Product.allocate

      it "should retrun true if the product is not in exceptions" do
        expect(product.send(:is_regular?, item_which_not_in_exception)).to eql(true)
      end

      item = ["1", "book", "at", "12.49"]
      product = Product.allocate

      it "should retrun false if the product is in exceptions" do
        expect(product.send(:is_regular?, item)).to eql(false)
      end

    end

    context "when input is not specified" do

      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:is_regular?, nil) }.to raise_error
      end

    end

    context "when input is blank" do

      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:parse_price, "") }.to raise_error
      end

    end

  end

  describe "#is_imported?" do

    context "when input is correct" do

      imported_item = ["1", "imported", "bottle", "of", "perfume", "at", "47.50"]
      product = Product.allocate

      it "should retrun true if the product is imported" do
        expect(product.send(:is_imported?, imported_item)).to eql(true)
      end

      not_imported_item = ["1", "book", "at", "12.49"]
      product = Product.allocate

      it "should retrun false if the product is not imported" do
        expect(product.send(:is_imported?, not_imported_item)).to eql(false)
      end

    end

    context "when input is not specified" do

      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:is_imported?, nil) }.to raise_error
      end

    end

    context "when input is blank" do

      product = Product.allocate

      it "should raise an error" do
        expect { product.send(:is_imported, "") }.to raise_error
      end

    end


  end


end