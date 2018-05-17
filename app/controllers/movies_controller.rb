class MoviesController < ApplicationController

  def show
    @movie=Movie.find(params[:id])
    @address=Address.where(movie_id: @movie.id).limit(1)
  end


  def new
    @movie=Movie.new
    @directors=Director.all
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
        @movie.address=Address.new(address_params)
        redirect_to @movie, notice: "Movie successfully created!"
      else
        @directors=Director.all
        render :new
    end
  end


  private
  def movie_params
    params.require(:movie).
        permit(:title, :description, :director_id, :address_id, :release_date, :duration )
  end
  def address_params
    params.permit(:street, :apartment, :description, :zipcode)
  end

end
