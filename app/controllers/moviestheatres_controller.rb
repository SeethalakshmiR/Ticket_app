# frozen_string_literal: true

# movies theatre controller
class MoviestheatresController < ApplicationController
  def index
    @mov1 = Moviestheatre.find_by(theatre_id: params[:theatre_id],
                                  movie_id: params[:movie_id])
  end
end
