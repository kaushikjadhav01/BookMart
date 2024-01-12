class ReviewPolicy < ApplicationPolicy

  def update?
    @user.is_admin || @user == @record.user
  end

  def destroy?
    @user.is_admin || @user == @record.user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
