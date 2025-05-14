class EventController < ApplicationController
  protect_from_forgery except: [:add, :update, :delete]

  def get
    events = Event.all
    render json: events.map { |e|
      {
        id: e.id,
        start_date: e.start,
        end_date: e.end,
        text: e.text
      }
    }
  end

  def add
    event = Event.new(event_params)
    if event.save
      render json: { action: "inserted", tid: event.id }
    else
      render json: { action: "error" }
    end
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render json: { action: "updated" }
    else
      render json: { action: "error" }
    end
  end

  def delete
    event = Event.find(params[:id])
    if event.destroy
      render json: { action: "deleted" }
    else
      render json: { action: "error" }
    end
  end

  private

  def event_params
    params.permit(:start_date, :end_date, :text)
  end
end
