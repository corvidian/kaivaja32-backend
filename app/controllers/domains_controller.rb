class DomainsController < ApplicationController
  before_action :set_domain, only: [:show, :update, :destroy]

  # GET /domains
  # GET /domains.json
  def index
    @domains = Domain.all

    render json: @domains
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
    render json: @domain
  end

  # POST /domains
  # POST /domains.json
  def create
    @domain = Domain.new(domain_params)

    if @domain.save
      render json: @domain, status: :created, location: @domain
    else
      render json: @domain.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    @domain = Domain.find(params[:id])

    if @domain.update(domain_params)
      head :no_content
    else
      render json: @domain.errors, status: :unprocessable_entity
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    @domain.destroy

    head :no_content
  end

  private

    def set_domain
      @domain = Domain.find(params[:id])
    end

    def domain_params
      params.require(:domain).permit(:name, :median, :min, :max, :avg, :server, :framework)
    end
end
