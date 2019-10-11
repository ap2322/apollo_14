class Astronaut < ApplicationRecord
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  validates_presence_of :name, :age, :job

  def self.average_age
    Astronaut.average(:age).round(0)
  end

  def all_missions
    self.missions.order(:title).pluck(:title)
  end

end
