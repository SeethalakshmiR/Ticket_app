# frozen_string_literal: true

# theatre controller

class TheatresController < ApplicationController
  def index
    @mov = Movie.find_by(id: params[:id])
    @theatre = @mov.theatres
  end
end
