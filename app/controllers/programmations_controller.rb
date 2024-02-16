# frozen_string_literal: true

class ProgrammationsController < ApplicationController
  def show
    @diffusions = Diffusion.find_programmation_de_la_journee
  end
end
