class EventsController < ApplicationController

  def new
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    date = DateTime.new(year,month,day)
    @event = Event.new
    @event.start = date
    @event.end = date
    @task = Task.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      redirect_to root_path, alert: '時間設定が間違っています！'
    end
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def index
    @events = Event.all
    @event = Event.new
    @task = Task.all
  end

  def edit

    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path

  end

  private

  def event_params
    params.require(:event).permit(:title, :start, :end)
  end

end
