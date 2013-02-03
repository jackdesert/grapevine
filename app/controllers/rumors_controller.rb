class RumorsController < ApplicationController
  respond_to :json

  def index
    respond_with Rumor.all
  end

  def show
    respond_with Rumor.find(params[:id])
  end

  def create
    respond_with Rumor.create(params[:rumor])
  end

  def update
    respond_with Rumor.update(params[:id], params[:rumor])
  end

  def destroy
    respond_with Rumor.destroy(params[:id])
  end

end
