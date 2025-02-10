require_relative 'coffee'
require_relative 'inventory'

class CoffeeShop
  def initialize
    @orders = []
    @inventory = Inventory.new
  end

  def self.place_order(type, size)
    coffee = Coffee.new(type, size) 
    puts "📖 Placed order for a #{coffee.description}"  
    @orders.push(coffee)
  end

  def fulfill_orders
    puts "🔄 Fulfilling orders..."

    @orders.each do |coffee|
      if !@inventory.has_enough_supplies?(coffee)
        @inventory.use_supplies(1)
        puts "✅ Fulfilled order for #{coffee.description}"
      else
        puts "❌ Insufficient supplies for #{coffee.description}"
      end
    end

    clean_up
  end

  private

  def clean_up
    puts "There are #{@orders.count} orders remaining!"
  end
end
