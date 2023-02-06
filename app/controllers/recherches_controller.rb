# frozen_string_literal: true

class RecherchesController < ApplicationController
  def show
    @query = params[:q]
    if @query.blank?
      @results = []
    else
      @results = Emission.where('nom ILIKE ?', "%#{@query}%")
    end
  end
end
