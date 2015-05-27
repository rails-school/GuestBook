class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update]

  def user_for_paper_trail
    # TODO: get the current user from the js itself?
    "Guest"
  end

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to edit_event_path(@event), notice: 'Event was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /events/1
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.js
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :guestbook_js)
    end

end
