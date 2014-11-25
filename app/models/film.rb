class Film < ActiveRecord::Base
  self.table_name = 'film'
  self.primary_key = 'film_id'

  has_many :inventories
  has_many :categories through: :film_category
end
