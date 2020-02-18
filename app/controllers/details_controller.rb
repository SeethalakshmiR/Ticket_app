# frozen_string_literal: true

class DetailsController < ApplicationController
  before_action :set_detail, only: [:show]

  def index
    @details = Detail.all
  end

  def show; end

  def new
    @det = Moviestheatre.find_by(id: params[:id])
    @show1 = Theatreshow.find_by(id: params[:show_id])
    @moviename = Movie.find_by(id: @det.movie_id)
    @theatrename = Theatre.find_by(id: @det.theatre_id)
    @detail = Detail.new(moviestheatre_id: @det.id,
                         confirm_movie_name: @moviename.name,
                         confirm_theatre_name: @theatrename.name,
                         show_time: @show1.name)
  end

  def create
    @detail = Detail.new(detail_params)
    @det1 = Moviestheatre.find_by(id: @detail.moviestheatre_id)
    @mov = Movie.find_by(name: @detail.confirm_movie_name )
    @the = Theatre.find_by(name: @detail.confirm_theatre_name )
    ticketcount = @detail.no_of_seats
    obj = @detail.show_time
    s = Theatreshow.find_by(name: obj, theatre_id: @the.id)
    count = s.seat_count
      if ticketcount <= count
        count -= ticketcount
        s.update!(seat_count: count)
        if @detail.save
          redirect_to @detail, notice: 'You are successfully booked for the show.'
        else
          redirect_to new_detail_path(id: @detail.moviestheatre_id, show_id: s.id),
                                      notice: ' Email has been already taken '
        end
      else
        redirect_to theatreshows_index_path(movie_id: @mov.id, theatre_id: @the.id, id: s.id),
                                    notice: 'Unable to book the ticket for this show '
      end
  end

  private

  def set_detail
    @detail = Detail.find(params[:id])
  end

  def detail_params
    params.require(:detail).permit(:name, :email, :phone, :no_of_seats,
                                   :confirm_theatre_name, :confirm_movie_name,
                                   :show_time, :moviestheatre_id)
  end
end
