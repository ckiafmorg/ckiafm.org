# frozen_string_literal: true

class BaladosController < ApplicationController
  def index
    @balados = Balado.published.live.includes(:episodes)
  end
end
