class Customer

  attr_reader :name, :age
  attr_accessor :wallet, :drunkenness

  def initialize(name,age,wallet,drunkenness)
    @name = name
    @age = age
    @wallet = wallet
    @drunkenness = drunkenness
  end

  def buy_drink(drink)
    price = drink.price
    @wallet -= price
    alcohol_level = drink.alcohol_level
    @drunkenness += alcohol_level
  end

end
