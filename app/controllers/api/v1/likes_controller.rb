class Api::V1::LikesController < ApplicationController

    def create
        like=Like.new(like_params)
        if like.save
            render json: like
        else
            render json:{message: 'invalid like'}
        end
    end

    def remove_like
        like=Like.find_by(user_id: params[:user_id], post_id: params[:post_id]).destroy
        render json: {message: 'delete succesful'}
    end


    private

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end

end
