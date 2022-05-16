class ProfilePolicy < ApplicationPolicy

    def index?
        @user.has_role?(:admin)
    end

    def show?
        return (@user && @user.has_role?(:admin)) || (@user && @user.profile.id == @record.id)
    end

    def destroy?
        index?
    end
end