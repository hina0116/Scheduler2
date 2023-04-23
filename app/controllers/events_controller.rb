class EventsController < ApplicationController

  def new
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    date = DateTime.new(year,month,day)
    @event = Event.new
    @event.start = date
    @event.end = date
    #render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.js {render partial: "error" }
      end
    end
  end

  def index
    @events = Event.all
    @event = Event.new
  end

  def update
  end

  def destroy
  end

  private

    def event_params
        params.require(:event).permit(:title, :start, :end)
    end

end
