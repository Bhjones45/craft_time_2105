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
end
