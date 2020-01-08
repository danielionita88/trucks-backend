class Api::V1::UsersController < ApplicationController

    def index 
        users=User.all 
        render json: users
    end

    def login
    end

    def current_user
    end

    def create
        user= User.create(user_params)
        if user.valid?
            render json: {user: UserSerializer.new(user)}, status: :created
        else
            render json:{error: 'failed to create user'}, status: :not_acceptable
        end
    end

    def liked_posts
        user=User.find(params[:id])
        render json: user.liked_posts
    end


    private

    def user_params
        params.require(:user).permit(:username,:password, :password_confirmation, :email)
    end
end
