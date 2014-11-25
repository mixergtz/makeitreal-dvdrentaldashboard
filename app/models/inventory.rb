class Inventory < ActiveRecord::Base
  self.table_name = 'inventory'
  self.primary_key = 'inventory_id'

  has_many :rental
  belongs_to :film

end
