class ItemPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def create?
    true
  end
end
