# frozen_string_literal: true

require 'application_system_test_case'

class TheatreTest < ApplicationSystemTestCase
  def setup
    @theatre = theatres(:one)
    @movie = movies(:one)
  end

  test 'should have a content' do
    visit theatres_index_path(id: @movie.id)
    assert_selector 'h2', text: 'welcome to the theatre'
  end

  test 'should redirect to details' do
    visit theatres_index_path(id: @movie.id)
    click_on @theatre.name
    visit new_detail_path
  end
end
