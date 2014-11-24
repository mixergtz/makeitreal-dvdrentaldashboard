class Payment < ActiveRecord::Base
  self.table_name = 'payment'
  self.primary_key = 'payment_id'

  def self.global_sales_by_month
    sales = select("date_trunc('month', payment_date) as month, sum(amount) as ventas").group("month")
    result = {}
    sales.each do |el|
      result[el.month.strftime("%B/%Y")] = el.ventas
    end
    result
  end

  def self.sales_by_category
    sales = select("date_trunc('month', payment_date) as month, sum(amount) as ventas").group("month")
    result = {}
    sales.each do |el|
      result[el.month.strftime("%B/%Y")] = el.ventas
    end
    result
  end

end
