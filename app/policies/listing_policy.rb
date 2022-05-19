# frozen_string_literal: true

class ListingPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def admin_index?
    return (@user && @user.has_role?(:admin))
  end

  def show?
    true
  end

  def create?
    true if @user && @user.profile
  end

  def new?
    create?
  end

  def update?
    admin_or_owns?
  end

  def edit?
    update?
  end

  def destroy?
    admin_or_owns?
  end

  def edit_or_destroy?
  return @user && (edit? || destroy?)
  end

  def admin_or_owns?
    return (@user && @user.has_role?(:admin)) || (@user.id == @record.profile_id)
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
