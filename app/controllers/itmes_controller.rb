class ItmesController < ApplicationController
    before_action :find_cart
    def index
        @items=@cart.items
        render json: @items, status: 200
    end
    def show
        @item=@cart.items.find(params[:id])
        render json: @item, status: 200
    end

    def create
        @item=@cart.items.create(item_params)
        if @item.save
            render json: {message: "item added successfully", data: @item}, status: 200
        else
            render json: {message: "item cannot be added", error: @item.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @item=@cart.items.find(params[:id])
        @item.destroy
        render json: {message: "Item removed successfully"}, status: :ok
    end

    private
    def find_cart
        @cart=current_user.cart.find(params[:cart_id])
    end
    def item_params
        params.require(:item).permit(:item_name,:price)
    end
end
