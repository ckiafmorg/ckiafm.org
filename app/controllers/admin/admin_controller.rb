# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    before_action :authorize

    layout 'admin'

    def authorize
      redirect_to new_session_path unless Current.user.signed_in?
    end
  end
end
