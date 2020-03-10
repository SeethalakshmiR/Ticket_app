# frozen_string_literal: true

# movie controller
class MoviesController < ApplicationController
  def index
    @movie = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'You are successfully added new movie.'
    else
      redirect_back fallback_location: root_path, notice: 'Give correct value'
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    if params[:search].empty?
      @movie = []
    else
      @movie = Movie.where('name ilike ? or actor ilike ?',
                           "%#{params[:search]}%", "%#{params[:search]}%")


      @details = []
      @movie.each do |movie|
        @movietheatre = Moviestheatre.where(movie_id: movie.id)
        @theatre = []
        @movietheatre.each do |movietheatre|
          @theatre << Theatre.find_by(id: movietheatre.theatre_id)
        end
          @theatre.each do |theatre|
            @details << {theatrename: theatre.name, name: movie.name, actor: movie.actor}
          end
      end
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name)
  end
end
