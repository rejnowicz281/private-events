class EventsController < ApplicationController
    before_action :require_login, only: [:new]

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)

        if @event.save
            redirect_to @event
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def event_params
        params.require(:event).permit(:name, :description, :date, :location, :host_id)
    end
end
