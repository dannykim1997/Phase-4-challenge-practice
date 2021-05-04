class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :like_post]
    before_action :set_form, only: [:new, :edit]
    def index
        @posts = Post.all
    end

    def show
        @destination = @post.destination
        @blogger = @post.blogger
        @content = @post.content
        @likes = @post.likes
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        @post.likes = 0
        if @post.valid?
            redirect_to post_path(@post)
        else
            redirect_to new_post_path(post)
        end
    end

    def like_post
        updated_likes = @post.likes + 1
        @post.update(likes: updated_likes)
        redirect_to post_path(@post)
    end

    def edit 
    end

    def update
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to @post
        else
            render :edit
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :destination_id, :blogger_id)
    end   
    
    def find_post 
        @post = Post.find(params[:id])
    end

    def set_form
        @bloggers = Blogger.all
        @destinations = Destination.all
        @posts = Post.all
    end
end
