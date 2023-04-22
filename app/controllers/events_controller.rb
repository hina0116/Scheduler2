class EventsController < ApplicationController
  def new
    @event = Event.new
    render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
  end

  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @events = Event.all
    respond_to do |format|
      format.html
      format.xml { render :xml => @events }
      format.json { render :json => @events }
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
      @event = Event.find(params[:id])
  end

  def event_params
      params.require(:event).permit(:title, :content, :start, :end)
  end
end
