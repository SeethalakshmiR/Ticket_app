# frozen_string_literal: true

require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @movie = movies(:one)
  end

  test 'should get index' do
    get movies_index_url
    assert_response :success
  end

  test 'should report error' do
    assert_raises(NameError) do
      some_undefined_variable
      assert true
    end
  end
end
