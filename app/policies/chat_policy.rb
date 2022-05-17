class ChatPolicy < ApplicationPolicy

    def index?
        return (@user && @user.has_role?(:admin))
    end

    def show?
        return (@user && @user.has_role?(:admin)) || (@user && @user.profile.id == @record.seller.id) || (@user && @user.profile.id == @record.buyer.id)
    end
end