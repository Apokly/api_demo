# frozen_string_literal: true

class LeaguePolicy < ApplicationPolicy
  def index?
    true
  end

  def join?
    user.league.nil? && record.users.size < League::MAX_USERS
  end

  def leave?
    record.present?
  end

  def show?
    true
  end
end
