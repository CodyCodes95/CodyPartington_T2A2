class PurchasesController < ApplicationController

    def index
        if current_user.has_role? :admin
            @purchases = Purchase.all
        else @purchases = current_user.profile.buyer_purchases
            @sales = current_user.profile.seller_purchases
        end
    end

    def show
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


end

