class ChartsController < ApplicationController
  before_action :set_chart, only: [:show, :update, :destroy]

  # GET /charts
  # GET /charts.json
  def index
    @charts = Chart.all

    render json: @charts
  end

  # GET /charts/1
  # GET /charts/1.json
  def show
    render json: @chart
  end

  # POST /charts
  # POST /charts.json
  def create
    @chart = Chart.new(chart_params)

    if @chart.save
      render json: @chart, status: :created, location: @chart
    else
      render json: @chart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /charts/1
  # PATCH/PUT /charts/1.json
  def update
    @chart = Chart.find(params[:id])

    if @chart.update(chart_params)
      head :no_content
    else
      render json: @chart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /charts/1
  # DELETE /charts/1.json
  def destroy
    @chart.destroy

    head :no_content
  end

  private

    def set_chart
      @chart = Chart.find(params[:id])
    end

    def chart_params
      params.require(:chart).permit(:min, :max, :count)
    end
end
