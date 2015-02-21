class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :update, :destroy]

  # GET /widgets
  # GET /widgets.json
  def index
    @widgets = Widget.all

    render json: @widgets
  end

  # GET /widgets/1
  # GET /widgets/1.json
  def show
    render json: @widget
  end

  # POST /widgets
  # POST /widgets.json
  def create
    @widget = Widget.new(widget_params)

    if @widget.save
      render json: @widget, status: :created, location: @widget
    else
      render json: @widget.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /widgets/1
  # PATCH/PUT /widgets/1.json
  def update
    @widget = Widget.find(params[:id])

    if @widget.update(widget_params)
      head :no_content
    else
      render json: @widget.errors, status: :unprocessable_entity
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.json
  def destroy
    @widget.destroy

    head :no_content
  end

  private

    def set_widget
      @widget = Widget.find(params[:id])
    end

    def widget_params
      params.require(:widget).permit(:datapoint_id, :name)
    end
end
