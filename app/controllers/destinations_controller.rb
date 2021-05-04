class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
        @most_recent_posts = @destination.most_recent_posts
        @popular_post = @destination.popular_post
        @avg_blogger_age = @destination.avg_blogger_age
    end

end
