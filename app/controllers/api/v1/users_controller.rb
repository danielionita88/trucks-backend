class Api::V1::UsersController < ApplicationController

    def index 
        users=User.all 
        render json: users
    end

    def login
        user= User.find_by(username: params['username'])
        if user && user.authenticate(params['password'])
            token = JWT.encode({id: user.id}, 'secret', 'HS256')
            render json: {id: user.id, username: user.username, token: token}
        else 
            render json: {error: 'invalid credentials'}
        end
    end

    def show
        token = request.headers['Authorization'].split(' ')[1]
        decoded_token = JWT.decode token, 'secret', true, { algorithm: 'HS256' }
        user_id=decoded_token[0]['id']
        user=User.find(user_id)
        if user
            render json: {id: user.id, username: user.username, token: token}
        else 
            render json: {error: 'invalid token'}
        end
    end

    

    def create
        user= User.create(user_params)
        if user.valid?
            render json: {id: user.id, username: user.username}, status: :created
        else
            render json:{error: 'failed to create user'}, status: :not_acceptable
        end
    end

    def liked_posts
        user=User.find(params[:id])
        render json: {u}
    end

    def posts 
        user=User.find(params[:id])
        photos = user.posts.map{|post| photos(post)}
        render json:{posts:user.posts, photos: photos} 
    end


    private

    def photos(post)
        post.photos.map{|photo| url_for(photo)}
    end

    def user_params
        params.require(:user).permit(:username,:password, :password_confirmation, :email)
    end
end
