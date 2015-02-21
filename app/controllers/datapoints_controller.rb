class DatapointsController < ApplicationController
  before_action :set_datapoint, only: [:show, :update, :destroy]

  # GET /datapoints
  # GET /datapoints.json
  def index
    @datapoints = Datapoint.all

    render json: @datapoints
  end

  # GET /datapoints/1
  # GET /datapoints/1.json
  def show
    render json: @datapoint
  end

  # POST /datapoints
  # POST /datapoints.json
  def create
    p = datapoint_params
    #pd = p[:domain, :responsetime, :server, :framework]
    pd = {domain: p[:domain], responsetime: p[:responsetime], server: p[:server], framework: p[:framework]}
    @datapoint = Datapoint.new(pd)
    puts params[:datapoint][:widgets]
    puts '******'
    puts p

    if @datapoint.save
      if params[:datapoint][:widgets] != nil
        params[:datapoint][:widgets].each { |a| @datapoint.widgets.create(name: a) }
      end
      render json: @datapoint, status: :created, location: @datapoint
    else
      render json: @datapoint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /datapoints/1
  # PATCH/PUT /datapoints/1.json
  def update
    @datapoint = Datapoint.find(params[:id])

    if @datapoint.update(datapoint_params)
      head :no_content
    else
      render json: @datapoint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /datapoints/1
  # DELETE /datapoints/1.json
  def destroy
    @datapoint.destroy

    head :no_content
  end

  private

    def set_datapoint
      @datapoint = Datapoint.find(params[:id])
    end

    def datapoint_params
      params.require(:datapoint).permit(:domain, :responsetime, :server, :framework, :widgets)
    end
end
