class PurchasesController < ApplicationController

    include Pundit::Authorization
     rescue_from Pundit::NotAuthorizedError, with: :forbidden

    before_action :authenticate_user!
    before_action :check_auth, except: [:show, :create]

    def index
        @orders = Purchase.all
    end

    def show
        find_orders
    end

    def create
        Listing.destroy(purchase_params[:listing_id])
        @purchase = Purchase.new(purchase_params.except(:listing_id))
        authorize @purchase
        @purchase.save
        redirect_to purchases_path
    end

    private

    def purchase_params
        params.permit(:car_id, :buyer_id, :seller_id, :date_purchased, :listing_id, :price)
    end

    def find_orders
        @purchases = current_user.profile.buyer_purchases
        @sales = current_user.profile.seller_purchases
    end

    def check_auth
        authorize @purchases
        authorize @sales
    end

end

