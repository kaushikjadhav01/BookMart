# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.is_admin
  end

  def show?
    @user.is_admin
  end

  def create?
    @user.is_admin
  end

  def new?
    create?
  end

  def update?
    @user.is_admin
  end

  def edit?
    update?
  end

  def destroy?
    @user.is_admin
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
