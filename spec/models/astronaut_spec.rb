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

    it 'makes a list of all an astronauts mission in alphabetical order' do
      armstrong = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
      aldrin = Astronaut.create(name: 'Buzz Aldrin', age: 39, job: 'NASA Astronaut' )
      ride = Astronaut.create(name: 'Sally Ride', age: 31, job: 'NASA Astronaut' )

      apollo_11 = Mission.create(title: 'Apollo 11', time_in_space: 195)
      apollo_11 = Mission.create(title: 'Apollo 11', time_in_space: 195)

      gemini_11 = Mission.create(title: 'Gemini 11', time_in_space: 71)

      sts_7 = Mission.create(title: 'Challenger Mission STS-7', time_in_space: 146)
      sts_41 = Mission.create(title: 'Challenger Mission STS-41-G', time_in_space: 197)

      armstrong_apollo = AstronautMission.create(astronaut_id: armstrong.id, mission_id: apollo_11.id)
      armstrong_gemini = AstronautMission.create(astronaut_id: armstrong.id, mission_id: gemini_11.id)
      aldrin_apollo = AstronautMission.create(astronaut_id: aldrin.id, mission_id: apollo_11.id)
      ride_sts_7 = AstronautMission.create(astronaut_id: ride.id, mission_id: sts_7.id)
      ride_sts_41 = AstronautMission.create(astronaut_id: ride.id, mission_id: sts_41.id)

      expect(armstrong.all_missions).to eq(['Apollo 11', 'Gemini 11'])
      expect(aldrin.all_missions).to eq(['Apollo 11'])
      expect(ride.all_missions).to eq(['Challenger Mission STS-41-G', 'Challenger Mission STS-7'])
    end

    it 'should caclualate total time in space for one astronaut' do
      armstrong = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
      aldrin = Astronaut.create(name: 'Buzz Aldrin', age: 39, job: 'NASA Astronaut' )
      ride = Astronaut.create(name: 'Sally Ride', age: 31, job: 'NASA Astronaut' )

      apollo_11 = Mission.create(title: 'Apollo 11', time_in_space: 195)
      apollo_11 = Mission.create(title: 'Apollo 11', time_in_space: 195)

      gemini_11 = Mission.create(title: 'Gemini 11', time_in_space: 71)

      sts_7 = Mission.create(title: 'Challenger Mission STS-7', time_in_space: 146)
      sts_41 = Mission.create(title: 'Challenger Mission STS-41-G', time_in_space: 197)

      armstrong_apollo = AstronautMission.create(astronaut_id: armstrong.id, mission_id: apollo_11.id)
      armstrong_gemini = AstronautMission.create(astronaut_id: armstrong.id, mission_id: gemini_11.id)
      aldrin_apollo = AstronautMission.create(astronaut_id: aldrin.id, mission_id: apollo_11.id)
      ride_sts_7 = AstronautMission.create(astronaut_id: ride.id, mission_id: sts_7.id)
      ride_sts_41 = AstronautMission.create(astronaut_id: ride.id, mission_id: sts_41.id)

      expect(armstrong.time_in_space).to eq(266)
      expect(aldrin.time_in_space).to eq(195)
      expect(ride.time_in_space).to eq(343)
    end
  end
end
