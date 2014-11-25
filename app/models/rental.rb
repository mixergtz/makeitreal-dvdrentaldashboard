class Rental < ActiveRecord::Base
  self.table_name = 'rental'
  self.primary_key = 'rental_id'

  has_many :payment
  belongs_to :inventory
end
