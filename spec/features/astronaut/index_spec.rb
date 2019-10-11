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
end
