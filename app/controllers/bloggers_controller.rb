class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
        @post = @blogger.most_liked
        @destination = Destination.find(params[:id])
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.valid?
            @blogger.save
          flash[:success] = "Object successfully created"
          redirect_to @blogger
        else
          flash[:error] = "Something went wrong"
          render :new
        end
    end

    def destroy
        @blogger = Blogger.find_by(id: params[:id])
        @blogger.destroy
        redirect_to bloggers_path
    end
    
    private
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
    
end
