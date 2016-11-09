require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  
  def test_accept_money 
    register = CashRegister.new(100)
    apple = Transaction.new(25)
    apple.amount_paid = 25
    original_amount = register.total_money
    register.accept_money(apple)
    new_amount = register.total_money
    assert_equal original_amount + 25, new_amount
  end
  
  def test_change
    register = CashRegister.new(100)
    apple = Transaction.new(25)
    apple.amount_paid = 30
    assert_equal register.change(apple), 5
  end
  
  def test_give_receipt
    register = CashRegister.new(100)
    apple = Transaction.new(25)
    assert_output("You've paid $#{apple.item_cost}.\n") do
      register.give_receipt(apple)
    end
  end
end
