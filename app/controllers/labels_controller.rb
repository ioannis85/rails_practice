class LabelsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:load_labels]
  before_action :initialize_overweight_service, :only =>[:load_labels]
  def load_labels
    labels = labels_params
    results = @overweight_service.calculate(labels[:labels])
    render :json => results
  end
  
  def index
    render "labels/index"
  end

  def report
    @labels = Label.all.decorate
    render "labels/report"
  end

private
  def initialize_overweight_service
    @overweight_service = OverweightCalculatorService.new
  end

  def labels_params
    params.permit(labels:[ 
    :tracking_number,
    :carrier,
    parcel:[
      :length,
      :width,
      :height,
      :weight,
      :distance_unit,
      :mass_unit]
    ])
  end

end
