class CriticismsController < ApplicationController
  before_action :load_criticisms, only: :index
  before_action :load_criticism, only: :show

  rescue_from Criticism::NotFound, with: :not_found

  def index; end

  def show; end

  private

  def load_criticisms
    @criticisms = Criticism.all
  end

  def load_criticism
    @criticism = Criticism.find(params[:id].to_i)
  end
end
