class Api::V1::PostsController < ApplicationController

    def index
        posts = Post.all 
        render json: posts
    end

    def create
        post=Post.new(post_params)
        byebug
        if post.save
            render json: post
        else
            render json: {error: 'invalid post'}
        end
        
    end


    private

    def post_params
        params.require(:post).permit(:user_id, :title, :make, :model, :model_year, :price, :odometer, :title_status, :city, :description, :photos)
    end
end
