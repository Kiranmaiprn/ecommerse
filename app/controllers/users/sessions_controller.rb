# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #  include RackSessionFix
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:name, keys: [:attribute])
  # end
  private
  def respond_with(resource,options={})
      render json: {
        status: {code: 200, message: "Logged in successfully"},
        data: UsersigninSerializer.new(resource)
      }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers["Authorization"].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
    current_user =User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: {code: 200, message: "Logged out Successfully"},
      }, status: :ok
    else
      render json:{
        status: {code: 401, message: "Couldn't find an active session"}
      }, status: :unauthorized
    end
  end
end