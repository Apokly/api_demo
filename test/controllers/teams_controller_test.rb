# frozen_string_literal: true

require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  # include PolicyTest

  def authenticated_header
    Knock::AuthToken.new(payload: { sub: users(:test).id }).token
  end

  test 'authenticated client can access his prices' do
    team = Team.create! name: 'Team test', owner: users(:test)
    get api_v1_teams_path, headers: { 'Authorization' => "Bearer #{authenticated_header}" }

    assert_response :ok
    body = JSON.parse(response.body)

    assert_equal team.name, body['name']
  end
end
