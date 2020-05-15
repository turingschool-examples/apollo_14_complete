class Mission < ApplicationRecord
  validates_presence_of :title, :time_in_space
  has_many :astronaut_missions
  has_many :astronauts, through: :astronaut_missions

  def self.alphabatize_names
    order(:title).pluck(:title)
  end

  def self.average_time_in_space
    sum(:time_in_space)||0
  end
end
