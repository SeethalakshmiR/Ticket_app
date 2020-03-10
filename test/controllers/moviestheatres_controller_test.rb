# frozen_string_literal: true

require 'test_helper'

class MoviestheatresControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get moviestheatres_url
    assert_response :success
  end
end
