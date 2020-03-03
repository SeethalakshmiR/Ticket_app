# frozen_string_literal: true

# movies theatre controller
class MoviestheatresController < ApplicationController
  def index
    @mov1 = Moviestheatre.find_by(theatre_id: params[:theatre_id],
                                  movie_id: params[:movie_id])
    @show = Theatreshow.find_by(id: params[:id])
  end

  def new
    @movie = Movie.all
    @theatre = Theatre.all
    @movie_id = []
    @theatre_id = []
    @movie.each do |movie|
      @movie_id << movie.id
    end
    @theatre.each do |theatre|
      @theatre_id << theatre.id
    end

    @movietheatre = Moviestheatre.new
  end

  def create
    @movietheatre = Moviestheatre.new(theatre_params)
    if @movietheatre.save
      redirect_to @movietheatre, notice: 'You are successfully added new theatre.'
    else
      redirect_back fallback_location: root_path, notice: 'Give correct value'
    end
  end

  private

  def theatre_params
    params.require(:moviestheatre).permit(:movie_id, :theatre_id)
   end
end
