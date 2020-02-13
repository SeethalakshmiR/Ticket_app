# frozen_string_literal: true

require 'application_system_test_case'

class DetailTest < ApplicationSystemTestCase
  def setup
    @details = details(:one)
  end

  test 'visit new path' do
    visit new_detail_path
    assert_selector 'h1', text: 'Enter details'
  end

  test 'can create details' do
    # click_on theatres(:one)
    visit new_detail_path
    # find_field('name').set(@details.name)
    # fill_in(name,visible: true, :with => @details.name)
    fill_in 'Name', with: @details.name
    fill_in 'Email', with: @details.email
    fill_in 'Phone', with: @details.phone
    fill_in 'No_of_seats', with: @details.no_of_seats
    fill_in 'Show_time', with: @details.show_time
    fill_in 'Confirm_theatre_name', with: @details.confirm_theatre_name
    fill_in 'Confirm_movie_name', with: @details.confirm_movie_name
    click_on 'Create Detail'
    visit confirmations_index
    assert_text 'you are successfully booked for the show'
  end
end
