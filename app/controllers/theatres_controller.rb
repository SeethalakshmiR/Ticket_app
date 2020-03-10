# frozen_string_literal: true

# theatre controller

class TheatresController < ApplicationController
  def index
    @theatre = Theatre.all
  end

  def new
    @theatre = Theatre.new
  end

  def create
    @theatre = Theatre.new(theatre_params)
    if @theatre.save
      redirect_to @theatre, notice: 'You are successfully added new theatre.'
    else
      redirect_back fallback_location: root_path, notice: 'Give correct value'
    end
  end

  def show
    @mov = Movie.find_by(id: params[:id])
    @theatre = @mov.theatres
  end

  private

  def theatre_params
    params.require(:theatre).permit(:name)
  end
end
