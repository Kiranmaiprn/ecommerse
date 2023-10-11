class CartsController < ApplicationController
    before_action :authenticate_user!
  def create
    user=current_user
    @cart = user.cart.create
    if @cart.save
      render json: {message: "cart created successfully", cart_id: @cart.id}, status: 200
    else
      render json: {message: "cart couldn't be created", error: @cart.errors.full_messages}, status: :unauthorized
    end
  end

  def index
    @cart=current_user.cart
    render json: @cart, status: 200
  end

  def destroy
    @cart=current_user.cart
    @cart.destroy
    render json: {message: "cart deleted"}, status: :ok
  end
end
