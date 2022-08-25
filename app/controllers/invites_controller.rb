class InvitesController < ApplicationController
    def create
        @invite = current_user.invites.create(event_id: params[:event_id], invited_id: params[:invited_id])

        redirect_to event_path(params[:event_id])
    end

    def destroy
        @invite = current_user.invites.find_by(event_id: params[:event_id], invited_id: params[:invited_id])

        @invite.destroy
        redirect_to event_path(params[:event_id]), status: 303
    end
end
