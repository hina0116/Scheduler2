class EventsController < ApplicationController
  def index
    @diary = Diary.new
  end
end
