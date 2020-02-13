# frozen_string_literal: true

# contains list of movies
class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :moviestheatres
  has_many :theatres, through: :moviestheatres
end
