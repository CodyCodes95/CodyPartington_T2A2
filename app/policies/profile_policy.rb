class ProfilePolicy < ApplicationPolicy

  def index?
    return @user && @user.has_role?(:admin)
  end

  def show?
    admin_or_owns
  end

  def new?
   true && @user
  end

  def create?
    new?
  end

  def edit?
    update?
  end

  def update?
    admin_or_owns
  end

  def destroy?
    admin_or_owns
  end

  private

  def admin_or_owns
    return (@user && @user.has_role?(:admin)) || (@user && @user.profile.id == @record.id)
  end

end


