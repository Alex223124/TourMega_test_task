require_relative './lib/file_input_parser'
require_relative './lib/purchase'
require_relative './lib/check_printer'
require_relative './lib/receipt'

require './lib/taxes/tax'
require './lib/taxes/standard_tax'
require './lib/taxes/import_tax'
require './lib/product'

filename = ARGV.first
purchase = CheckPrinter.new(filename)
purchase.run