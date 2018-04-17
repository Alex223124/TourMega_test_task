describe "file input parser" do

  describe "#initialize" do

    context "when filename is correct" do

      filename = "test_input1.txt"
      file_input_parser = FileInputParser.new(filename)
      correct_value = ["1 book at 12.49\n", "1 music CD at 14.99\n", "1 chocolate bar at 0.85"]

      it "should set @items instance varialbe with correct value" do
        expect(file_input_parser.instance_variable_get("@items")).to eql(correct_value)
      end

    end

    context "when filename is incorrect" do

      incorrect_filename = "111111111111111111111.txt"
      error_message = "Wrong file name, Please use the existing file name from the input_files folder"

      it "should raise an error" do
        expect{ FileInputParser.new(incorrect_filename) }.to raise_error(error_message)
      end

    end

    context "when filename is not specified " do

      it "should raise an error" do
        expect { FileInputParser.new(nil) }.to raise_error
      end

    end

    context "when filename is blank" do

      it "should raise an error" do
        expect { FileInputParser.new("") }.to raise_error
      end

    end

  end

  describe "#parse_file_input" do

    context "when filename is correct" do

      filename = "test_input1.txt"
      file_input_parser = FileInputParser.new(filename)
      correct_value = ["1 book at 12.49\n", "1 music CD at 14.99\n", "1 chocolate bar at 0.85"]

      it "should produce correct value" do
        expect(file_input_parser.send(:parse_input, filename )).to eql(correct_value)
      end

    end

    context "when filename is incorrect" do

      file_input_parser = FileInputParser.allocate
      incorrect_filename = "111111111111111111111.txt"
      error_message = "Wrong file name, Please use the existing file name from the input_files folder"

      it "should raise an error" do
        expect{file_input_parser.send(:parse_input, incorrect_filename )}.to raise_error(error_message)
      end

    end

    context "when filename is not specified " do

      file_input_parser = FileInputParser.allocate

      it "should raise an error" do
        expect { file_input_parser.send(:parse_input, nil ) }.to raise_error
      end

    end

    context "when filename is blank" do

      file_input_parser = FileInputParser.allocate

      it "should raise an error" do
        expect { file_input_parser.send(:parse_input, "" ) }.to raise_error
      end

    end

  end

end