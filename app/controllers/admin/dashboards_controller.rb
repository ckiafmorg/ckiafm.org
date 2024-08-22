# frozen_string_literal: true

module Admin
  class DashboardsController < AdminController
    def show
      if Current.user.admin?
        @emissions = Emission.all
        @balados = Balado.all
      else
        @emissions = Current.user.emissions
        @balados = Current.user.balados
      end
    end
  end
end
