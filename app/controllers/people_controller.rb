class PeopleController < ApplicationController

  def index
    if params[:q]=="actor"
      redirect_to :controller => "actors", :action =>"index"
    elsif params[:q]=="director"
      redirect_to :controller => "directors", :action =>"index"
    else
    end
  end


  def new
  end

  def create
    new_params=Hash.new
    new_params["first_name"]=params[:first_name]
    new_params["last_name"]=params[:last_name]
    new_params["description"]=params[:description]
    new_params["birth_date"]=params[:birth_date]
    if params[:role]=="actor"
      @actor = Actor.new(new_params)
      if @actor.save
        redirect_to @actor, notice: "Actor successfully created!"
      else
        render :new
      end
    else
      @director=Director.new(new_params)
      if @director.save
        redirect_to @director, notice: "Director successfully created!"
      else
        render :new
      end
    end

  end


end