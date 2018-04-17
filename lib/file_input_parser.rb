class FileInputParser

  FILES_FOLDER_BASE_URL = "./input_files/"

  attr_reader :items

  def initialize(filename)
    if filename
      @items = parse_input(filename)
    else
      raise "No file given. Please specify filename. You can choose on from input_files folder"
    end
  end

  private

  def parse_input(filename)
    path = FILES_FOLDER_BASE_URL + filename
    if File.exist?(path)
      File.open(FILES_FOLDER_BASE_URL + filename).to_a
    else
      raise "Wrong file name, Please use the existing file name from the input_files folder"
    end
  end

end

