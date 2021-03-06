
class Api::V1::PostsController < ApplicationController

    def index
        posts = Post.all 
        render json: posts
    end

    def create
        post=Post.new(post_params)
        if post.save
            render json: post
        else
            render json: {error: 'invalid post'}
        end
    end

    def show
        post=Post.find(params[:id])
        render json: post
    end

    def destroy
        post=Post.find(params[:id])
        post.destroy()
        render json: {message: 'delete succesful'}
    end

    def google_maps
        render json: {key: MAPS_SECRET}
    end


    private

    def post_params
        params.permit(:user_id, :title, :make, :model, :model_year, :price, :odometer, :title_status, :address, :lat, :lng, :description, {photos: []})
    end
end
