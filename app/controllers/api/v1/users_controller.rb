class Api::V1::UsersController < ApplicationController 
  after_action :set_code_on_create, only: [:create]

  def create 
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.hashed(user)
    else
      render json: MessageSerializer.hashed(user.errors.full_messages.to_sentence)
    end
  end 

  def session
    user = User.find_by(email: params[:email])
    if user.present? && password_authenticated?(user, params[:password], params[:password_confirmation])
      render json: UserSerializer.hashed(user)
    else 
      render json: MessageSerializer.hashed_login_error
    end 
  end 

  private 

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end 

  def password_authenticated?(user, password, password_confirmation)
    user.authenticate(password) && user.authenticate(password_confirmation)
  end 

  def set_code_on_create
    response.status = 201 if response.status == 200
  end
end 