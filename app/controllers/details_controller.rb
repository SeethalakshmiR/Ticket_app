# frozen_string_literal: true

class DetailsController < ApplicationController
  before_action :set_detail, only: [:show]

  def index
    @details = Detail.all
  end

  def show; end

  def new
    time = Time.new.strftime(' %k : %M ')
    if time < ' 07 : 00 '
      @option = [['select', ''], 'Morning show(starting time 8.00 am)',
                                 'Matinee show(starting time 12.00 pm)',
                                 'Evening show(starting time 4.00 pm)',
                                 'Night show(starting time 8.00 pm)']

    elsif time > ' 07 : 00 ' && time < ' 11 : 00 '
      @option = [['select', ''], 'Matinee show(starting time 12.00 pm)',
                                 'Evening show(starting time 4.00 pm)',
                                 'Night show(starting time 8.00 pm)']

    elsif time > ' 11 : 00 ' && time < ' 15 : 00 '
      @option = [['select', ''], 'Evening show(starting time 4.00 pm)',
                                 'Night show(starting time 8.00 pm)']

    elsif time > ' 15 : 00 ' && time < ' 19 : 00 '
      @option = [['select', ''], 'Night show(starting time 8.00 pm)']
    end
    binding.pry
    @det = Moviestheatre.find_by(id: params[:id])
    @moviename = Movie.find_by(id: @det.movie_id)
    @theatrename = Theatre.find_by(id: @det.theatre_id)
    @detail = Detail.new(moviestheatre_id: @det.id,
                         confirm_movie_name: @moviename.name,
                         confirm_theatre_name: @theatrename.name)
  end

  def create
    @detail = Detail.new(detail_params)
    @movthe = @detail.moviestheatre_id
    @det1 = Moviestheatre.find_by(id: @movthe)
    morningshow_count = @det1.morning_show_count
    matineeshow_count = @det1.matinee_show_count
    eveningshow_count = @det1.evening_show_count
    nightshow_count = @det1.night_show_count
    ticketcount = @detail.no_of_seats
    if @detail.show_time == 'Night show(starting time 8.00 pm)'
      if nightshow_count != 0
        if ticketcount <= nightshow_count
          nightshow_count -= ticketcount
          @det1.update!(night_show_count: nightshow_count)

          if @detail.save
            redirect_to @detail, notice: 'You are successfully booked for the show.'
          else
            redirect_to new_detail_path(id: @movthe), notice: ' Email has been already taken '
          end
        else

          redirect_to new_detail_path(id: @movthe), notice: ' Unable to book the ticket for this show '
        end
      else
        redirect_to new_detail_path(id: @movthe), notice: 'Unable to book the ticket for this show '
      end
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
