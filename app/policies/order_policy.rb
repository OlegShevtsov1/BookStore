class OrderPolicy < ApplicationPolicy
  def show?
    user.present?
  end
end
