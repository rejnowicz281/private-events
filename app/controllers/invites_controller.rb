class InvitesController < ApplicationController
    def create
        event_host = Event.find(params[:event_id]).host
        @invite = event_host.invites.create(event_id: params[:event_id], invited_id: params[:invited_id])

        redirect_to event_path(params[:event_id])
    end

    def destroy
        event_host = Event.find(params[:event_id]).host
        @invite = event_host.invites.find_by(event_id: params[:event_id], invited_id: params[:invited_id])

        @invite.destroy
        redirect_to event_path(params[:event_id]), status: 303
    end
end
