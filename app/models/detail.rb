# frozen_string_literal: true

# contains user details
class Detail < ApplicationRecord
  validates :name, :phone, :no_of_seats, :email, :show_time, presence: true
  validates :confirm_theatre_name, :confirm_movie_name, presence: true
  validates :email, uniqueness: true, format: /\A[^@]+@[^@]+\z/
end
