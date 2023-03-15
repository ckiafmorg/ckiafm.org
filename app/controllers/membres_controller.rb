# frozen_string_literal: true

class MembresController < ApplicationController
  def show
    @membres = Membre.all
  end

  def new
    @membre = Membre.new
  end

  def create
    @membre = Membre.new(membre_params)

    if @membre.save
      redirect_to admin_path
    else
      redirect_to admin_publicites_index_path
    end
  end

  private

  def membre_params
    params.require(:membre).permit(:prenom, :nom, :email, :payed)
  end
end
