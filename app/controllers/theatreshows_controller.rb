class TheatreshowsController < ApplicationController
    def index
        @shows = []
        @theatreshow = Theatreshow.where(theatre_id: params[:theatre_id])
        @theatreshow.each do |theatre|
            @theatre1 = theatre.time
            @time = @theatre1.strftime('%k:%M')
            @c_time = Time.now.strftime('%k:%M')
            @t = @theatre1.strftime('%k:%M').to_i
            @current = Time.now.strftime('%k:%M').to_i
            if @time > @c_time &&  @t - @current > 1
              @the = Theatreshow.find_by(time: @time)
              @shows << @the
            end
        end
        @theatre = Theatre.find_by(id: params[:theatre_id])
        @movies = Movie.find_by(id: params[:movie_id])
    end
end
