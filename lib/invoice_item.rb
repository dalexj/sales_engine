class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price,
              :created_at,   :updated_at, :item,     :invoice

  def initialize(data)
    @id                 = data[:id]
    @item_id            = data[:item_id]
    @invoice_id         = data[:invoice_id]
    @quantity           = data[:quantity]
    @unit_price         = BigDecimal.new("#{data[:unit_price]}") / 100
    @created_at         = data[:created_at]
    @updated_at         = data[:updated_at]
  end

  def assign_item(item)
    @item = item
  end

  def assign_invoice(invoice)
    @invoice = invoice
  end

  def successful?
    invoice.successful?
  end

  def revenue
    unit_price * quantity.to_i
  end
end
