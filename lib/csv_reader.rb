require 'csv'
require 'date'
require 'bigdecimal'
require 'bigdecimal/util'
require_relative 'merchant'
require_relative 'item'
require_relative 'customer'
require_relative 'invoice_item'
require_relative 'invoice'
require_relative 'transaction'

class CSVReader
  def read(file_name, dir = "data")
    type      = find_which_object(file_name)
    file_name = File.join dir, file_name
    entries   = []
    options   = { headers: true ,header_converters: :symbol, converters: :all }
    CSV.foreach(file_name, options) { |row| entries << type.new(row.to_hash) }
    return entries
  end

  def find_which_object(file_name)
    objects.find do |class_name|
      file_name.gsub("_", "") =~ Regexp.new(class_name.to_s, "i")
    end
  end

  private

  def objects
    [Merchant, InvoiceItem, Item, Customer, Invoice, Transaction]
  end
end
