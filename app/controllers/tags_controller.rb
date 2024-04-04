# frozen_string_literal: true

class TagsController < ApplicationController
  def show
    @tag = Tag.includes(:emissions).includes(:articles).find(params[:id])
  end
end
