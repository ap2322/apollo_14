require 'rails_helper'

RSpec.describe "On the /astronauts index" do
  it "should show a list of astronauts with their
      - Name
      - Age
      - Job " do

    armstrong = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    aldrin = Astronaut.create(name: 'Buzz Aldrin', age: 39, job: 'NASA Astronaut' )
    ride = Astronaut.create(name: 'Sally Ride', age: 31, job: 'NASA Astronaut' )

    visit '/astronauts'

    expect(page).to have_content(armstrong.name)
    expect(page).to have_content(armstrong.age)
    expect(page).to have_content(armstrong.job)
    expect(page).to have_content(aldrin.name)
    expect(page).to have_content(aldrin.age)
    expect(page).to have_content(aldrin.job)
    expect(page).to have_content(ride.name)
    expect(page).to have_content(ride.age)
    expect(page).to have_content(ride.job)
  end

  it "should show the average age of all astronauts" do
    armstrong = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    aldrin = Astronaut.create(name: 'Buzz Aldrin', age: 39, job: 'NASA Astronaut' )
    ride = Astronaut.create(name: 'Sally Ride', age: 31, job: 'NASA Astronaut' )

    visit '/astronauts'

    expect(page).to have_content("Average age of astronauts: 36")
  end

  it "shows a list of space missions for each astronaut" do
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

    visit '/astronauts'

    within "#astronaut-#{armstrong.id}" do
      expect(page).to have_content(apollo_11.title)
      expect(page).to have_content(gemini_11.title)
    end

    within "#astronaut-#{aldrin.id}" do
      expect(page).to have_content(apollo_11.title)
    end

    within "#astronaut-#{ride.id}" do
      expect(page).to have_content(sts_7.title)
      expect(page).to have_content(sts_41.title)
    end
  end

  it 'shows the total time in space for each astronaut' do
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

    visit '/astronauts'

    within "#astronaut-#{armstrong.id}" do
      expect(page).to have_content("Total time in space: 266 hours")
    end

    within "#astronaut-#{aldrin.id}" do
      expect(page).to have_content("Total time in space: 195 hours")
    end

    within "#astronaut-#{ride.id}" do
      expect(page).to have_content("Total time in space: 343 hours")
    end

  end
end

# User Story 4 of 4
#
# As a visitor,
# When I visit '/astronauts'
# I see the total time in space for each astronaut.
# (e.g. "Name: Neil Armstrong, Age: 37, Job: Commander, Total Time in Space: 760 days")
