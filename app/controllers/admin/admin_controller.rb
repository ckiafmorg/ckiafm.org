# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    before_action :signed_in?

    layout 'admin'

    def signed_in?
      redirect_to new_session_path unless Current.user.signed_in?
    end

    def ensure_user_is(role)
      head :forbidden unless Current.user.role == role.to_s
    end
  end
end
