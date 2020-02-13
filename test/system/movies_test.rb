# frozen_string_literal: true

require 'application_system_test_case'

class MovieTest < ApplicationSystemTestCase
  def setup
    @movie = movies(:one)
  end

  test 'should have a content' do
    visit movies_index_path
    assert_selector 'h1', text: 'welcome'
  end

  test 'should redirect to theatres' do
    visit movies_index_path(@movie)
    click_on @movie.name
    visit theatres_index_path
  end
end
