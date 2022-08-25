class InvitesController < ApplicationController
    def create
        @invite = current_user.invites.create(event_id: params[:event_id], invited_id: params[:invited_id])

        redirect_to new_invite_path
    end

    def destroy
        @invite = current_user.invites.find_by(event_id: params[:event_id], invited_id: params[:invited_id])

        @invite.destroy
        redirect_to new_invite_path, status: 303
    end
end
