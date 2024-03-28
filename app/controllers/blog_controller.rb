# frozen_string_literal: true

class BlogController < ApplicationController
  def index
    @articles = Article.published.live
  end

  def show
    @article = Article.find(params[:id])
  end
end
