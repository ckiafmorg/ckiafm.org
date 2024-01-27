# frozen_string_literal: true

class EmissionsController < ApplicationController
  def index; end

  def show
    @emission = Emission.active.friendly.find(params[:id])
  end
end
