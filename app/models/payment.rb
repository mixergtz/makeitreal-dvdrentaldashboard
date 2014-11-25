class Payment < ActiveRecord::Base
  self.table_name = 'payment'
  self.primary_key = 'payment_id'

  belongs_to :rental

  def self.global_sales_by_month(city)
    sales = select("date_trunc('month', payment_date) as month, sum(amount) as ventas").joins("INNER JOIN staff ON payment.staff_id = staff.staff_id")
                                                                                       .joins("INNER JOIN store ON store.store_id = staff.store_id")
                                                                                       .joins("INNER JOIN address ON store.address_id = address.address_id")
                                                                                       .joins("INNER JOIN city ON city.city_id = address.city_id")
                                                                                       .where("city.city_id = ?", city)
                                                                                       .group("month")
    result = {}
    sales.each do |el|
      result[el.month.strftime("%B/%Y")] = el.ventas
    end
    result
  end

  def self.sales_by_category
    sales = select("category.name as category, sum(amount) as ventas").joins("INNER JOIN rental ON payment.rental_id = rental.rental_id")
                                                                      .joins("INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id")
                                                                      .joins("INNER JOIN film_category ON inventory.film_id = film_category.film_id")
                                                                      .joins("INNER JOIN category ON category.category_id = film_category.category_id")
                                                                      .group("category")
    result = {}
    sales.each do |el|
      result[el.category] = el.ventas
    end
    result
  end

  def self.sales_by_store
    sales = select("category.name as category, sum(amount) as ventas").joins("INNER JOIN rental ON payment.rental_id = rental.rental_id")
                                                                      .joins("INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id")
                                                                      .joins("INNER JOIN film_category ON inventory.film_id = film_category.film_id")
                                                                      .joins("INNER JOIN category ON category.category_id = film_category.category_id")
                                                                      .group("category")
    result = {}
    sales.each do |el|
      result[el.category] = el.ventas
    end
    result
  end

  def self.sales_by_store
    sales = select("store.store_id as sucursal, sum(amount) as ventas").joins("INNER JOIN rental ON payment.rental_id = rental.rental_id")
                                                                       .joins("INNER JOIN staff ON staff.staff_id = rental.staff_id")
                                                                       .joins("INNER JOIN store ON store.store_id = staff.store_id")
                                                                       .group("sucursal");
    result = {}
    sales.each do |el|
      result[el.sucursal] = el.ventas
    end
    result
  end

  def self.best_10_customers
    sales = select("CONCAT(customer.first_name, ' ', customer.last_name) as cliente, sum(amount) as ventas").joins("INNER JOIN customer ON payment.customer_id = customer.customer_id")
                                                                                                            .group("cliente")
                                                                                                            .order("ventas DESC")
                                                                                                            .limit(10)
                                                                                                                result = {}
    sales.each do |el|
      result[el.cliente] = el.ventas
    end
    result
  end

end
