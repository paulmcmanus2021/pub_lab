require('minitest/autorun')
require('minitest/rg')

require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../pub.rb')

class TestPub < MiniTest::Test

  def setup()
    @beer = Drink.new("Beer", 2.99, 1)
    @wine = Drink.new("Wine", 3.49, 2)
    @whisky = Drink.new("Whisky", 4.99, 3)
    @vodka = Drink.new("Vodka", 3.99, 4)
    @drinks = [@beer, @wine, @whisky, @vodka]
    @pub = Pub.new("Winchester", 56.77, @drinks)
    @customer1 = Customer.new("Rab",39, 14.30, 12)
    @customer2 = Customer.new("Sean",17,10.00, 7)
    @customer3 = Customer.new("Reginald",45,650.00, 2)
  end

  def test_can_get_name()
    assert_equal("Winchester", @pub.name)
  end

  def test_can_get_till()
    assert_equal(56.77, @pub.till)
  end

  def test_count_drinks_array()
    assert_equal(4, @pub.count_drinks_array())
  end

  def test_add_cash()
    @pub.add_cash(@beer)
    assert_equal(59.77, @pub.till)
  end

  def test_serve_customer_check__old
    assert_equal(true, @pub.serve_customer_check(@customer3))
  end

  def test_serve_customer_check__young
    assert_equal(false, @pub.serve_customer_check(@customer2))

  end

  def test_customer_too_drunk_true
    assert_equal(false, @pub.serve_customer_check(@customer1))
  end

  def test_customer_too_drunk_false
    assert_equal(true, @pub.serve_customer_check(@customer3))
  end

end
