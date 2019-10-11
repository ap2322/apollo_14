require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Methods' do
    it 'cacluates the average age of all astronauts' do
      armstrong = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
      aldrin = Astronaut.create(name: 'Buzz Aldrin', age: 39, job: 'NASA Astronaut' )
      ride = Astronaut.create(name: 'Sally Ride', age: 31, job: 'NASA Astronaut' )

      expect(Astronaut.average_age).to eq(36)
    end
  end
end
