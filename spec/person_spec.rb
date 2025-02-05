require 'rspec'
require './lib/person'

RSpec.describe Person do
  describe 'instantiation' do
    it 'exists' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person).to be_a(Person)
    end

    it 'has attributes' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person.name).to eq('Hector')
      expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
      expect(person.supplies).to eq({})
    end
  end
  describe 'Methods' do
    it 'can add supplies' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      person.add_supply('scissors', 1)
      person.add_supply('fabric', 4)

      expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    end

    it 'can add more supplies' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      person.add_supply('scissors', 1)
      person.add_supply('fabric', 4)
      person.add_supply('fabric', 3)

      expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})
    end

    it 'can build the craft' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})

      expect(hector.can_build?(sewing)).to eq(false)

      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)

      expect(hector.can_build?(sewing)).to eq(false)

      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)

      expect(hector.can_build?(sewing)).to eq(true)
    end
  end
end
