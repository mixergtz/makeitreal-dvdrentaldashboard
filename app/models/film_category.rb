class FilmCategory < ActiveRecord::Base
  self.table_name = 'film_category'
  self.primary_key = 'film_id'

  belongs_to :film
  belongs_to :category
end
