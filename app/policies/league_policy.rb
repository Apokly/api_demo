# frozen_string_literal: true

class LeaguePolicy < ApplicationPolicy
  def index?
    true
  end

  def join?
    user.league.nil? && record.users.size < record.class::MAX_USERS
  end

  def leave?
    record.present?
  end

  def show?
    user.league == record || record.open?
  end
end
