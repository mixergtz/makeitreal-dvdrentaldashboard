class Category < ActiveRecord::Base
  self.table_name = 'category'
  self.primary_key = 'category_id'

  has_many :films, through: :film_categories
end
