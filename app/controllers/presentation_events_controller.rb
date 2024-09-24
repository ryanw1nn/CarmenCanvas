class PresentationEventsController < ApplicationController
  before_action :set_presentation_event, only: %i[ show edit update destroy ]

  # GET /presentation_events or /presentation_events.json
  def index
    @presentation_events = PresentationEvent.all
  end

  def join
    @presentation_event = PresentationEvent.find(params[:id])
    current_user.presentation_events << @presentation_event unless current_user.presentation_events.include?(@presentation_event)
    redirect_to @presentation_event, notice: "You have joined the presentation event successfully."
  end

  def leave
    @presentation_event = PresentationEvent.find(params[:id])
    current_user.presentation_events.delete(@presentation_event) unless !current_user.presentation_events.include?(@presentation_event)
    redirect_to @presentation_event, notice: "You have left the presentation event successfully."
  end

  # GET /presentation_events/1 or /presentation_events/1.json
  def show
  end

  # GET /presentation_events/new
  def new
    @presentation_event = PresentationEvent.new
  end

  # GET /presentation_events/1/edit
  def edit
  end

  # POST /presentation_events or /presentation_events.json
  def create
    @presentation_event = PresentationEvent.new(presentation_event_params)

    respond_to do |format|
      if @presentation_event.save
        format.html { redirect_to presentation_event_url(@presentation_event), notice: "Presentation event was successfully created." }
        format.json { render :show, status: :created, location: @presentation_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @presentation_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentation_events/1 or /presentation_events/1.json
  def update
    respond_to do |format|
      if @presentation_event.update(presentation_event_params)
        format.html { redirect_to presentation_event_url(@presentation_event), notice: "Presentation event was successfully updated." }
        format.json { render :show, status: :ok, location: @presentation_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @presentation_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentation_events/1 or /presentation_events/1.json
  def destroy
    @presentation_event.destroy!

    respond_to do |format|
      format.html { redirect_to presentation_events_url, notice: "Presentation event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def index_with_stats
    @presentation_events = PresentationEvent.includes(:evaluations, :users)
    @users = User.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation_event
      @presentation_event = PresentationEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presentation_event_params
      params.require(:presentation_event).permit(:title, :date, :description)
    end
end
