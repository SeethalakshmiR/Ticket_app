# frozen_string_literal: true

require 'test_helper'

class ConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get confirmations_index_url
    assert_response :success
  end
end
