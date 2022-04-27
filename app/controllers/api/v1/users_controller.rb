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

  private 

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end 

  def set_code_on_create
    response.status = 201 if response.status == 200
  end
end 