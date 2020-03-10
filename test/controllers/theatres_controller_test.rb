# frozen_string_literal: true

require 'test_helper'

class TheatresControllerTest < ActionDispatch::IntegrationTest
  def setup
    @theatre = theatres(:one)
    @movie = movies(:one)
  end

  test 'should get index' do
    get theatres_index_url(id: @movie.id)
    assert_response :success
  end

  test 'should not valid without selecting movie' do
    @movie.id = nil
    assert theatres_index_url, 'Invalid'
  end

  test 'should report error' do
    assert_raises(NameError) do
      some_undefined_variable
      assert true
    end
  end
end
