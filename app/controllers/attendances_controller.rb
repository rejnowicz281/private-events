class AttendancesController < ApplicationController
    before_action :require_login, only: [:create]

    def create
        @attendance = current_user.attendances.create(attended_event_id: params[:event_id])
        invite = current_user.invites_received.find_by(event_id: params[:event_id])

        invite.destroy

        flash[:success] = "Successfully accepted Invite."
        redirect_to event_path(params[:event_id])
    end

    def destroy
        @attendance = current_user.attendances.find_by(attended_event_id: params[:event_id])

        @attendance.destroy

        flash[:success] = "Successfully cancelled Attendance."
        redirect_to event_path(params[:event_id]), status: 303
    end
end
