# frozen_string_literal: true

module Admin
  class ArticlesController < AdminController
    before_action do
      ensure_user_is :admin
    end

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
      @tags = Tag.all
    end

    def edit
      @article = Article.find(params[:id])
      @tags = Tag.all
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
      params.require(:article).permit(:titre, :status, :published_at, :contenu, tag_ids: [])
    end
  end
end
