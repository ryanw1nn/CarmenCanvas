class EvaluationsController < ApplicationController
  def new
    @presentation_event = PresentationEvent.find(params[:presentation_event_id])
    @evaluation = @presentation_event.evaluations.new
  end

  def create
    @presentation_event = PresentationEvent.find(params[:presentation_event_id])
    @evaluation = @presentation_event.evaluations.new(evaluation_params)
    @evaluation.user = current_user # Make sure current_user returns an instance of User
  
    if @evaluation.save
      redirect_to presentation_event_path(@presentation_event), notice: 'Comment was successfully submitted.'
    else
      # If there are errors, re-render the presentation_events/show view
      render 'presentation_events/show'
    end
  end
  def destroy
    @presentation_event = PresentationEvent.find(params[:presentation_event_id])
    @evaluation = @presentation_event.evaluations.find(params[:id])
    @evaluation.destroy
    redirect_to presentation_event_path(@presentation_event), notice: 'Comment was successfully deleted.'
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:score, :comment)
  end
end
