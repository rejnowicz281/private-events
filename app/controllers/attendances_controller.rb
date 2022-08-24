class AttendancesController < ApplicationController
    def create
        @attendance = current_user.attendances.create(attended_event_id: params[:event_id])

        redirect_to event_path(params[:event_id])
    end
end
