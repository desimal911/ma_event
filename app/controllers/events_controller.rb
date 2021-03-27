class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  before_action :set_post, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = current_user.posts.new(post_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(post_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
      @event.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Event was successfully destroyed.' }
      end
  end

  private

  def set_post
    @event = Event.find(params[:id])
  end

  def post_params
    params.require(:event).permit(:title, :body, :user_id)
  end
end

