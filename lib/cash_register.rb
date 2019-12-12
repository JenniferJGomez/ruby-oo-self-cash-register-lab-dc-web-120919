require 'pry'

class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction_amount

    def initialize(discount=0)
      self.total = 0
      self.discount = discount
      self.items = []
      self.last_transaction_amount = 0
    end
  
  
    def add_item(title, amount, quantity=1)
      self.total += amount * quantity
      quantity.times do
        items << title
      end
  
      self.last_transaction_amount = amount * quantity
    end
  
    def apply_discount
      if discount != 0
        self.total = (total * ((100.0 - discount.to_f)/100)).to_i
        return "After the discount, the total comes to $#{total}."
      else
        return "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= last_transaction_amount
    end
  end