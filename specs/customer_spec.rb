require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../pub.rb')

class TestPub < MiniTest::Test

  def setup
    @customer = Customer.new("Rab",39,14.30)
    @beer = Drink.new("Beer", 2.99, 1)
    @wine = Drink.new("Wine", 3.49, 2)
    @whisky = Drink.new("Whisky", 4.99, 3)
    @vodka = Drink.new("Vodka", 3.99, 4)
    @drinks = [@beer, @wine, @whisky, @vodka]
    @pub = Pub.new("Winchester",56.77,@drinks)
  end

  def test_can_get_customer
    assert_equal("Rab",@customer.name)
  end

  def test_can_get_age
    assert_equal(39,@customer.age)
  end

  def test_can_get_wallet
    assert_equal(14.30,@customer.wallet)
  end


  def test_buy_drink
    @customer.buy_drink(@beer)
    assert_equal(11.31, @customer.wallet)
  end

  def test_can_buy_drink
    #given a customer obj who has a wallet obj, remove cash
    @customer.buy_drink(@beer)
    #then take money from customer wallet AND add to till
    @pub.add_cash(@beer)
    assert_equal(11.31, @customer.wallet)
    assert_equal(59.77, @pub.till)
  end

  def test_drunkenness()
    @customer.buy_drink(@beer)
    assert_equal(1, @customer.drunkenness)
  end


#
end
