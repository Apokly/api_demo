# frozen_string_literal: true

require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  # include PolicyTest

  def authenticated_header
    Knock::AuthToken.new(payload: { sub: users(:test).id }).token
  end

  test 'authenticated client can access his team' do
    team = Team.create! name: 'Team test', owner: users(:test)
    get api_v1_user_team_path, headers: { 'Authorization' => "Bearer #{authenticated_header}" }

    assert_response :ok
    body = JSON.parse(response.body)

    assert_equal team.name, body['name']
  end

  test 'authenticated client can access another team' do
    team = Team.create! name: 'Team test', owner: users(:test)
    team2 = Team.create! name: 'Team test 2', owner: users(:test2)

    get api_v1_team_path(team2), headers: { 'Authorization' => "Bearer #{authenticated_header}" }

    assert_response :ok
    body = JSON.parse(response.body)

    assert_equal team2.name, body['name']
  end

  test 'authenticated client can update his team' do
    team = Team.create! name: 'Team test', owner: users(:test)
    put api_v1_user_team_path, params: { name: 'Updated name' }, headers: { 'Authorization' => "Bearer #{authenticated_header}" }

    assert_response :accepted
    body = JSON.parse(response.body)

    assert_equal 'Updated name', body['name']
  end
end
