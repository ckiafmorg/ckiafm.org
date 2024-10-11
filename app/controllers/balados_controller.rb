# frozen_string_literal: true

class BaladosController < ApplicationController
  def index
    @balados = Balado.published.live.includes(:episodes)
  end

  def show
    @balado = Balado.includes(:episodes).find(params[:id])
  end
end
