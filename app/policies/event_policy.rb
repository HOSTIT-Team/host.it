class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.user == user
  end

  def show?
    user
  end

  def create?
    user
  end

  def destroy?
    record.user == user
  end
end