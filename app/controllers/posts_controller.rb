class PostsController < ApplicationController
  class PostsController < ApplicationController
    before_action :set_user
  
    def index
      @posts = Post.all
    end
  
    def show
      @post = Post.find(params[:id])
      puts @post.inspect
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end
  end
