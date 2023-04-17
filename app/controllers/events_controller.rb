class EventsController < ApplicationController
  def new
    @event = events.new
    render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
  end
  def create
    @event = events.new(event_params)
    if @event.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  #create.js.erbを探してその中の処理を実行する
      end
    else
      respond_to do |format|
        format.js {render partial: "error" }
        #登録にエラーが起きたときはerror.js.erbを実行する
      end
    end
  end

  def index
    @events = Event.all
  end

  private

  def event_params
      params.require(:event).permit(:title, :start, :finish)
  end
end
