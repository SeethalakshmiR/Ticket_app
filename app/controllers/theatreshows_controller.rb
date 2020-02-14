class TheatreshowsController < ApplicationController
    def index
        @theatreshow = Theatreshow.where(theatre_id: params[:theatre_id])
        @movies = Movie.find_by(id: params[:movie_id])
    end
end
