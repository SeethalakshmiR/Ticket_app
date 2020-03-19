class CancellationsController < ApplicationController
  def new
    @cancellation = Cancellation.new
  end

  def create
      ticket = Detail.find_by(id: params[:cancellation][:ticket_id])
      theatre = Theatre.find_by(name: ticket.confirm_theatre_name)
      show = Theatreshow.find_by(theatre_id: theatre.id, name: ticket.show_time)
      show.update(seat_count: show.seat_count + ticket.no_of_seats)
      ticket.destroy
      redirect_to details_path, notice: 'You are successfully cancel the ticket.'
  end

end


