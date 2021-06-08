class Event
  attr_reader :name,
              :craft,
              :person,
              :crafts,
              :attendees

  def initialize(name, craft, person)
    @name = name
    @craft = craft
    @person = person
    @crafts = []
    @attendees = []
  end

  def add_craft(craft)
    @crafts << craft
  end

  def add_attendee(attendee)
    @attendees << attendee
  end

  def attendee_names
    names_array =[]
    @attendees.each do |person|
      names_array << person
    end
    names_array
  end

  def craft_with_most_supplies
    craft_hash = Hash.new(0)
    @crafts.each do |craft|
      require "pry"; binding.pry
      craft_hash = craft.name
    end
    craft_hash
  end

  # def supply_list
  #   supply_list = []
  #   @crafts.each do |craft|
  #     require "pry"; binding.pry
  #     supply_list << craft
  #   end
  # end
end
