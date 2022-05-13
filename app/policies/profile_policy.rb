class ProfilePolicy < ApplicationPolicy

  def index?
    return @user && @user.has_role?(:admin)
  end

  def show?
    return @user && @user.has_role?(:admin)
  end

end