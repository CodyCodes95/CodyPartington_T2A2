# frozen_string_literal: true

class ListingPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true if @user.profile
  end

  def new?
    create?
  end

  def update?
    @user && @user.has_role?(:admin)
  end

  def edit?
    update?
  end

  def destroy?
    return @user && @user.has_role?(:admin)
  end

    def edit_or_destroy?
    return @user && (edit? || destroy?)
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
