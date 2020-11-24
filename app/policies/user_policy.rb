class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    def show?
      true
    end
    def edit?
      record.user == user
    end

    def update?
      record.user == user
    end
  end
end
