# frozen_string_literal: true

# contails movie and theatre id
class Moviestheatre < ApplicationRecord
  belongs_to :movie
  belongs_to :theatre
  has_many :details

  validates :movie_id, :theatre_id, presence: true

end
