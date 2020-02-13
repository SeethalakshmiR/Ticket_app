# frozen_string_literal: true

# contails movie and theatre id
class Moviestheatre < ApplicationRecord
  belongs_to :movie
  belongs_to :theatre
  has_many :details

  validates :movie_id, :theatre_id, :morning_show_count, presence: true
  validates :matinee_show_count,
            :evening_show_count,
            :night_show_count, presence: true
end
