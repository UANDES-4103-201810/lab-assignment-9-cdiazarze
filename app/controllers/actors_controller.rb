class ActorsController < ApplicationController

def index
  @actors = Actor.all
end

def show
  @actor = Actor.find(params[:id])
end

def new
  @actor = Actor.new
end

def create
  @actor = Actor.new(actor_params)
  if @actor.save
    redirect_to @actor, notice: "Actor successfully created!"
  else
    render :new
  end
end

def edit
  @actor = Actor.find(params[:id])
end

def update
  @actor = Actor.find(params[:id])
  if @actor.update(actor_params)
    redirect_to @actor, notice: "Actor successfully updated!"
  else
    render :edit
  end
end

def destroy
  @actor = Actor.find(params[:id])
  @actor.destroy
end

private

  def actor_params
    params.require(:actor).
        permit(:first_name, :last_name, :description, :birth_date)
  end

end