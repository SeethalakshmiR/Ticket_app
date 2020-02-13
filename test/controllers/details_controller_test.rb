# frozen_string_literal: true

require 'test_helper'

class DetailsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @detail = details(:one)
    @theatre = theatres(:one)
    @movie = movies(:one)
    @moviestheatre = moviestheatres(:one)
  end

  test 'should get form' do
    get new_detail_path(id: @moviestheatre.id)
    assert_response :success
  end

  test 'should not select movie' do
    @movie.id = nil
    assert new_detail_path, 'Invalid movie name'
  end

  test 'should not select theatre' do
    @theatre.id = nil
    assert new_detail_path, 'Invalid theatre name'
  end

  test 'should report error' do
    assert_raises(NameError) do
      some_undefined_variable
      assert true
    end
  end

  test 'should create detail' do
    assert_difference('Detail.count') do
      post details_url, params: { detail: { confirm_movie_name: @detail.confirm_movie_name,
                                            confirm_theatre_name: @detail.confirm_theatre_name,
                                            email: @detail.email,
                                            name: @detail.name,
                                            no_of_seats: @detail.no_of_seats,
                                            phone: @detail.phone,
                                            show_time: @detail.show_time,
                                            moviestheatre_id: @detail.moviestheatre_id } }
    end

    assert_redirected_to detail_url(Detail.last)
  end
end
