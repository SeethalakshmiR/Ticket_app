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
    if params[:search]
      @movie = Movie.where('name ilike ? or actor ilike ?',
                           "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @movie = Movie.all
    end
    movie = @movie
    render json: movie
 end

  private

  def movie_params
    params.require(:movie).permit(:name)
  end
end
