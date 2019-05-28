class WorkshopPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def index?
      true
    end

    def show?
     # binding.pry
      true
    end

    def new?
      true
    end

    def create?
      true
    end

    def edit?
      record.owner = user
    end

    def update?
      record.owner = user
    end
end
