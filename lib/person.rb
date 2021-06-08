class Person
  attr_reader :info,
  :name,
  :interests,
  :supplies

  def initialize(info)
    @info = info
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, amount)
    @supplies[supply] += amount
  end

  def can_build?(craft)
    #if hector has {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1}
    #return true
    # else
    #return false
    can_craft = false
    craft.supplies_required.each do |key, value|
      @supplies.each do |inside_key, inside_value|
        if (key.to_s == inside_key) && (inside_value >= value)
          can_craft = true
        else
          can_craft = false
        end
      end
    end
    can_craft
  end
end
