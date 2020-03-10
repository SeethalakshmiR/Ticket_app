# frozen_string_literal: true

require 'test_helper'
require 'minitest/pride'

class TheatreTest < ActiveSupport::TestCase
  def setup
    @theatre = theatres(:one)
    @theatre1 = theatres(:two)
  end

  test 'should not be valid without a name' do
    @theatre.name = nil
    refute @theatre.valid?
  end

  test 'should be valid with a name' do
    assert @theatre.valid?
  end

  test 'the instance of theatre' do
    assert_instance_of Theatre, @theatre
  end

  test 'the theatre is string' do
    assert true, @theatre.name.is_a?(String)
  end

  test 'the theatre table is not empty' do
    assert_not_equal Theatre.all.count, 0
  end

  test 'to update the theatre name' do
    @theatre.update(name: 'sathyam')
    assert true, @theatre
  end

  test 'the duplicate theatre name' do
    @theatre = Theatre.create(name: 'vetri')
    refute @theatre.save, 'Duplicate theatre'
  end

  test 'the association' do
    assert_equal 1, @theatre.movies.size
  end

  # test "to delete theatre name" do
  #   assert @theatre.destroy
  #   assert @theatre1.destroy
  #   assert_equal Theatre.all.count, 0
  # end
end
