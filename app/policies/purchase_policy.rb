class PurchasePolicy < ApplicationPolicy

    def index?
        @user.has_role?(:admin)
    end

    def show?
        return (@user && @user.has_role?(:admin)) || (@user && @user.profile.id == @record.id)
    end

    def destroy?
        index?
    end
    
    def create?
        return (@user && @user.profile.id == @record.seller.id)
    end
end