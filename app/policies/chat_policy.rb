class ChatPolicy < ApplicationPolicy
    def index?
        return (@user && @user.has_role?(:admin))
    end

    def show?
        return (@user && @user.has_role?(:admin)) || (@user && @user.profile.id == @record.seller.id) || (@user && @user.profile.id == @record.buyer.id)
    end

    def create?
        return(@user && @user.profile)
    end

    def new_message?
        show?
    end

    def update?
        return (@user && @user.profile.id == @record.buyer.id)
    end

    def reject_offer?
        return (@user && @user.profile.id == @record.seller.id)
    end
end
