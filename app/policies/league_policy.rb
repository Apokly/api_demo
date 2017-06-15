# frozen_string_literal: true

class LeaguePolicy < ApplicationPolicy
  def index?
    true
  end

  def join?
    user.league.nil?
  end

  def leave?
    record.present?
  end

  def show?
    true
  end
end
