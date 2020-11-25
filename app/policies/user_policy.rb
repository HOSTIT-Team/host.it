class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    def show?
      user
    end
    
    def edit?
     true
    end

    def update?
      true
    end

    def new?
      true
    end
  end
end
