class PurchasesController < ApplicationController

    include Pundit::Authorization
     rescue_from Pundit::NotAuthorizedError, with: :forbidden

    before_action :authenticate_user!
    before_action :check_auth

    def index
        @orders = Purchase.all
    end

    def show
        find_orders
    end

    def create
        @purchase = Purchase.create(purchase_params)
            if @purchase.valid?
            redirect_to @purchase
        else
            show_error_retry(@listing, 'show')
        end
    end

    private

    def purchase_params
        params.permit(:car_id, :buyer_id, :seller_id, :date_purchased)
    end

    def find_orders
        @purchases = current_user.profile.buyer_purchases
        @sales = current_user.profile.seller_purchases
    end

end

