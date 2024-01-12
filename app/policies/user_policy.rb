class UserPolicy < ApplicationPolicy
  def show?
    @user.is_admin || @user == @record
  end

  def update?
    @user.is_admin || @user == @record
  end

  def destroy?
    @user.is_admin || @user == @record
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
