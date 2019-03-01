class BillboardsController < ApplicationController

  before_action :find_billboard, only: [:show, :edit, :update, :delete]

  def index
    @billboard = Billboard.all
  end

  def show
  end

  def new
    @billboard = Billboard.new
    render partial: 'form'
  end


  def edit
    render partial: 'form'
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to @billboard
    else 
      render :edit
    end
  end


  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to billboards_path
    else
      render :new
    end
  end

  def delete
    @billboard.destroy
    redirect_to billboards_path
  end

  private
  def billboard_params
    params.required(:billboard).permis(:name)
  end

  def find_billboard
    @billboard = Billboard.find(params[:id])
  end 
end
