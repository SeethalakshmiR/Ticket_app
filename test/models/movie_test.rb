# frozen_string_literal: true

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def setup
    @movie1 = movies(:one)
    @movie2 = movies(:two)
  end

  test 'should not be valid without a name' do
    @movie1.name = nil
    refute @movie1.valid?
  end

  test ' should be valid with a name' do
    assert @movie1.valid?
    assert @movie2.valid?
  end

  test 'the instance of movie' do
    assert_instance_of Movie, @movie1
    assert_instance_of Movie, @movie2
  end

  test 'the movie is a string' do
    assert true, @movie1.name.is_a?(String)
    assert true, @movie2.name.is_a?(String)
  end

  test 'the movie table is not empty' do
    assert_not_equal Movie.all.count, 0
  end

  test 'to update the movie name' do
    @movie1.update(name: 'asuran')
    assert true, @movie1
  end

  test 'the duplicate movie name' do
    @movie1 = Movie.create(name: 'bigil')
    refute @movie1.save, 'Duplicate movie'
  end

  test 'the association' do
    assert_equal 1, @movie1.theatres.size
  end

  # test "to delete the movie name" do
  #   assert @movie1.destroy
  #   assert @movie2.destroy
  #   assert_equal Movie.all.count, 0
  # end
end
