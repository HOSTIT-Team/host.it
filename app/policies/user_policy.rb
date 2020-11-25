class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    def show?
      user
    end
    
    def edit?
      record.user == user
    end

    def update?
      record.user == user
    end

    def new?
      true
    end
  end
end
