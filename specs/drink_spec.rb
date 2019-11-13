require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class TestDrink < MiniTest::Test

def setup
  @drink = Drink.new("Beer", 2.99, 1)
end

def test_can_get_name
  assert_equal("Beer", @drink.name)
end

def test_can_get_price
  assert_equal(2.99, @drink.price)
end

def test_can_get_alcohol_level
  assert_equal(1, @drink.alcohol_level)
end







#
end
