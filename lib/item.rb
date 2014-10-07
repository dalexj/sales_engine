class Item
  attr_reader :id, :description, :name, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize(data)
    @id                 = data[:id]
    @description        = data[:description]
    @name               = data[:name]
    @unit_price         = data[:unit_price]
    @merchant_id        = data[:merchant_id]
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def invoice_items
  end

  def merchant
  end
end
