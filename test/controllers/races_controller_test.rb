# frozen_string_literal: true

require 'test_helper'

class RacesControllerTest < ActionDispatch::IntegrationTest
  def authenticated_header
    Knock::AuthToken.new(payload: { sub: users(:test).id }).token
  end

  test 'authenticated user can list his league races' do
    user = users(:test)
    league = League.create! name: 'League test'
    user.update(league: league)

    get api_v1_league_races_path, headers: { 'Authorization' => "Bearer #{authenticated_header}" }

    assert_response :ok

    body = JSON.parse(response.body)
    race_names = body.map { |r| r['name'] }

    assert_equal league.races.pluck(:name), race_names
  end
end
