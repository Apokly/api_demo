# frozen_string_literal: true

require 'test_helper'

class LeaguesControllerTest < ActionDispatch::IntegrationTest
  def authenticated_header
    Knock::AuthToken.new(payload: { sub: users(:test).id }).token
  end

  test 'authenticated user can join a league' do
    user = users(:test)
    league = leagues(:league_one)

    post join_api_v1_league_path(league), headers: { 'Authorization' => "Bearer #{authenticated_header}" }

    assert_response :accepted

    assert_equal league, user.reload.league
  end

  test 'authenticated user associated with a league cannot join another league' do
    user = users(:test)
    user.league = leagues(:league_one)
    user.save!

    another_league = League.create! name: 'League two'

    post join_api_v1_league_path(another_league), headers: { 'Authorization' => "Bearer #{authenticated_header}" }

    assert_response :unauthorized
  end

  test 'authenticated user can leave a league' do
    user = users(:test)
    user.league = leagues(:league_one)
    user.save!

    post leave_api_v1_league_path, headers: { 'Authorization' => "Bearer #{authenticated_header}" }

    assert_response :accepted

    assert_nil user.reload.league
  end
end
