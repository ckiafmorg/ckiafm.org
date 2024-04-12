# frozen_string_literal: true

module Admin
  class TagsController < AdminController
    before_action do
      ensure_user_is :admin
    end

    def index
      @tags = Tag.all
    end

    def new
      @tag = Tag.new
    end

    def create
      @tag = Tag.new(tags_params)

      if @tag.save
        redirect_to admin_tags_path, notice: t('admin.tags.created_successfully')
      else
        render :new
      end
    end

    private

    def tags_params
      params.require(:tag).permit(:nom)
    end
  end
end
