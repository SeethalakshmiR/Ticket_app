# frozen_string_literal: true

require 'test_helper'

class MoviestheatreTest < ActiveSupport::TestCase
  def setup
    @movietheatre = moviestheatres(:one)
    @movietheatre1 = moviestheatres(:two)
  end

  test 'should not be valid without a movie id' do
    @movietheatre.movie_id = nil
    refute @movietheatre.valid?
  end

  test 'should not be valid without a theatre id' do
    @movietheatre.theatre_id = nil
    refute @movietheatre.valid?
  end

  test ' should be valid with a field' do
    assert @movietheatre.valid?
  end

  test 'the table is not empty' do
    assert_not_equal Moviestheatre.all.count, 0
  end

  test 'to delete the movie name' do
    assert @movietheatre.destroy
    assert @movietheatre1.destroy
    assert_equal Moviestheatre.all.count, 0
  end
end
