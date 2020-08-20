class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user || record.cake.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def show?
    record.user == user || record.cake.user == user
  end

  def destroy?
    update?
  end

  def accept?
    record.cake.user == user
  end

  def decline?
    record.cake.user == user
  end
end
