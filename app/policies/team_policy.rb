# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    user == record.owner
  end

  def show?
    true
  end
end
