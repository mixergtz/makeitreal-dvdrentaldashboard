class Payment < ActiveRecord::Base
  self.table_name = 'payment'
  self.primary_key = 'payment_id'

  #Returns array
  #Payment.group("date_trunc('month', payment_date)").sum('amount')
  #Returns ActiveRelation
  #Payment.select("date_trunc('month', payment_date) as month, sum(amount) as ventas").group("month")
end
