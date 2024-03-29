# frozen_string_literal: true

module Admin
  class ArticlesController < AdminController
    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def edit
      @article = Article.find(params[:id])
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to admin_articles_path, notice: t('admin.articles.created_successfully')
      else
        render :new
      end
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
        redirect_to admin_articles_path, notice: t('admin.articles.updated_successfully')
      else
        render :edit
      end
    end

    def destroy
      article = Article.find(params[:id])
      if article.destroy
        redirect_to admin_articles_path, notice: t('admin.articles.deleted_successfully')
      else
        redirect_to admin_articles_path, error: t('admin.articles.deletion_error')
      end
    end

    private

    def article_params
      params.require(:article).permit(:titre, :status, :published_at, :contenu)
    end
  end
end
