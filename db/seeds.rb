# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
