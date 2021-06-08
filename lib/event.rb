class Event
  attr_reader :name,
  :crafts,
  :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    names_array =[]
    @attendees.each do |person|
      names_array << person
    end
    names_array
  end

  def craft_with_most_supplies
    most_supplies = @crafts.max_by do |craft|
      craft.supplies_required.length
    end
    most_supplies.name
  end

  def supply_list
    array_hashes = @crafts.map do |craft|
      craft.supplies_required
    end

      array_hashes.flat_map do |hash|
        hash.keys.map do |key|
          key.to_s
        end
      end.uniq
    end
  end
