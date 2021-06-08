require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  describe 'instantiation' do
    it 'exists' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [craft], [person])

      expect(event).to be_a(Event)
    end

    it 'has attributes' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [craft], [person])

      expect(event.name).to eq("Carla's Craft Connection")
    end

    describe 'methods' do
      it 'can add crafts and attendees' do
        person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
        craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
        event = Event.new("Carla's Craft Connection", [craft], [person])

        event.add_craft(craft)
        event.add_attendee(person)
        expect(event.crafts).to eq([craft])
        expect(event.attendees).to eq([person])
      end

      it 'can create array of attendees' do
        hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
        toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
        sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
        knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
        event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

        event.add_attendee(hector)

        event.add_attendee(toni)
        expect(event.attendee_names).to eq([hector, toni])
      end

      it 'can find craft with most supplies' do
        hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
        toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
        sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
        knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
        event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
        event.add_attendee(hector)
        event.add_attendee(toni)

        expect(event.craft_with_most_supplies).to eq("sewing")
      end

      xit 'creates the supply list' do
        hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
        toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
        sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
        knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
        event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
        event.add_craft(sewing)
        event.add_craft(knitting)

        expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
      end
    end
  end
end
