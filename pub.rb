class Pub

attr_reader :name, :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def count_drinks_array
    return @drinks.length()
  end

  def add_cash(drink)
    price = drink.price
    @till += price.round
    @till.round()
  end

  def serve_customer_check(customer)
    if customer.age >= 18 && customer.drunkenness < 9
      return true
    else
      return false
    end
  end

end
