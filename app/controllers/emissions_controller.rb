# frozen_string_literal: true

class EmissionsController < ApplicationController
  def index; end

  def show
    @emission = Emission.live.find(params[:id])
  end
end
