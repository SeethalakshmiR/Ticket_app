# frozen_string_literal: true

class TheatreshowsController < ApplicationController
  def index
    @theatreshow = Theatreshow.all
    @theatre = Theatre.all
    @show = @theatre.ids
  end

  def new
    @theatreshow = Theatreshow.new
  end

  def show
    @shows = []
    @theatreshow = Theatreshow.where(theatre_id: params[:theatre_id])
    @theatreshow.each do |theatre|
      @theatre1 = theatre.time
      @time = @theatre1.strftime('%k:%M')
      @c_time = Time.now.strftime('%k:%M')
      @t = @time.to_i
      @current = @c_time.to_i
      if @time > @c_time && @t - @current > 1
        @the = Theatreshow.find_by(time: @time)
        @shows << @the
      end
    end
    @theatre = Theatre.find_by(id: params[:theatre_id])
    @movies = Movie.find_by(id: params[:movie_id])
  end

  def create
    @theatreshow = Theatreshow.new(theatreshow_params)
    if @theatreshow.save
      redirect_to @theatreshow, notice: 'You are successfully added new theatre.'
    else
      redirect_back fallback_location: root_path, notice: 'Give correct value'
    end
  end

  private

  def theatreshow_params
    params.require(:theatreshow).permit(:name, :time, :price, :theatre_id, :seat_count)
  end
end
