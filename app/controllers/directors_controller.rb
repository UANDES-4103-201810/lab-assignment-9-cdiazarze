class DirectorsController < ApplicationController

  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      redirect_to @director, notice: "Director successfully created!"
    end
  else
    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    if @director.update(director_params)
      redirect_to @director, notice: "Director successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @director= Director.find(params[:id])
    @director.destroy
  end

  private

  def director_params
    params.require(:director).
        permit(:first_name, :last_name, :description, :birth_date)
  end

end