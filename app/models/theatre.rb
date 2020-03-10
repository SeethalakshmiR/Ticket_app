# frozen_string_literal: true

# contains list of theatres
class Theatre < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :moviestheatres
  has_many :movies, through: :moviestheatres
end
