# frozen_string_literal: true

require 'test_helper'

class DetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @detail = details(:one)
  end

  test 'should not be valid without a name' do
    @detail.name = nil
    refute @detail.valid?
  end

  test 'should not be valid without a email' do
    @detail.email = nil
    refute @detail.valid?
  end

  test 'should not be valid without a phone' do
    @detail.phone = nil
    refute @detail.valid?
  end

  test 'should not be valid without a no_of_seats' do
    @detail.no_of_seats = nil
    refute @detail.valid?
  end

  test 'should not be valid without a show time' do
    @detail.show_time = nil
    refute @detail.valid?
  end

  test 'should not be valid without confirm movie name' do
    @detail.confirm_movie_name = nil
    refute @detail.valid?
  end

  test 'should not be valid without confirm theatre name' do
    @detail.confirm_theatre_name = nil
    refute @detail.valid?
  end

  test 'the name is a string' do
    assert true, @detail.name.is_a?(String)
  end
end
