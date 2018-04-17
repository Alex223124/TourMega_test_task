require './lib/check_printer'
require './lib/product'
require './lib/receipt'
require './lib/taxes/tax'
require './lib/taxes/standard_tax'
require './lib/taxes/import_tax'

describe "check printer" do

  describe "#initialize" do

    context "when a correct filename is specified" do

      filename = "test_input1.txt"
      check_printer = CheckPrinter.new(filename)
      correct_value = ["1 book at 12.49\n", "1 music CD at 14.99\n", "1 chocolate bar at 0.85"]

      it "should set @items instance varialbe with correct value" do
        expect(check_printer.instance_variable_get("@input").items).to eql(correct_value)
      end

    end

    context "when a filename is not specified" do

      filename = nil
      error_message = "No file given. Please specify filename. You can choose on from input_files folder"

      it "should raise 'no file given' error" do
        expect { CheckPrinter.new(filename) }.to raise_error(error_message)
      end

    end

    context "when an incorrect filename is specified" do

      filename = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.txt"
      error_message = "Wrong file name, Please use the existing file name from the input_files folder"

      it "should raise 'wrong file name' error" do
        expect { CheckPrinter.new(filename) }.to raise_error(error_message)
      end

    end

  end

  describe "#run" do

    filename = "test_input1.txt"

    context "when @input is specified correctly" do

      check_printer = CheckPrinter.new(filename)
      output = "1 book: 12.49\n1 music cd: 16.49\n1 chocolate bar: 0.85\nSales Total: 1.50\nTotal: 29.83\n"

      it "should produce correct output in console" do
        expect { check_printer.run }.to output(output).to_stdout
      end

    end

    context "when @input is specified incorrectly" do

      check_printer = CheckPrinter.new(filename)
      incorrect_input_data = "11111111111111111111111111111"
      check_printer.instance_variable_set("@input", incorrect_input_data)

      it "should raise an error" do
        expect { check_printer.run }.to raise_error
      end

    end

  end

  describe "#print" do

    check_printer = CheckPrinter.allocate

    context "when input is specified" do

      it "should produce correct output in console" do
        expect { check_printer.send(:print, "test") }.to output("test\n").to_stdout
      end

    end

    context "when input is nil" do

      it "should output nothing in console" do
        expect { check_printer.send(:print, nil) }.to output("\n").to_stdout
      end

    end

  end

end