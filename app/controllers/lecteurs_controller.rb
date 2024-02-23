# frozen_string_literal: true

class LecteursController < ApplicationController
  def show
    @current_emission = Diffusion.find_diffusion_en_cours&.first&.emission
    render :show
  end
end
