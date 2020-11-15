class OrderPolicy < ApplicationPolicy
  def show?
    user.present?
  end

  class Scope < Scope
    def resolve
      confirmation_status = Order.statuses[:confirmation]
      scope.where('status > ? and user_id = ?', confirmation_status, user.id)
    end
  end
end
