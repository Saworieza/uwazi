class CoalitionsController < ApplicationController
  before_action :set_coalition, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :owned_coalition, only: [:edit, :update, :destroy]

  # GET /coalitions
  # GET /coalitions.json
  def index
    @coalitions = Coalition.order('created_at DESC')
  end

  # GET /coalitions/1
  # GET /coalitions/1.json
  def show
  end

  # GET /coalitions/new
  def new
    @coalition = current_user.coalitions.build
  end

  # GET /coalitions/1/edit
  def edit
  end

  # POST /coalitions
  # POST /coalitions.json
  def create
    @coalition = current_user.coalitions.build(coalition_params)

    respond_to do |format|
      if @coalition.save
        format.html { redirect_to @coalition, notice: 'Coalition was successfully created.' }
        format.json { render :show, status: :created, location: @coalition }
      else
        format.html { render :new }
        format.json { render json: @coalition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coalitions/1
  # PATCH/PUT /coalitions/1.json
  def update
    respond_to do |format|
      if @coalition.update(coalition_params)
        format.html { redirect_to @coalition, notice: 'Coalition was successfully updated.' }
        format.json { render :show, status: :ok, location: @coalition }
      else
        format.html { render :edit }
        format.json { render json: @coalition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coalitions/1
  # DELETE /coalitions/1.json
  def destroy
    @coalition.destroy
    respond_to do |format|
      format.html { redirect_to coalitions_url, notice: 'Coalition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coalition
      @coalition = Coalition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coalition_params
      params.require(:coalition).permit(:name, :abbrev, :user_id)
    end

    def owned_coalition  
      unless current_user == @coalition.user
        flash[:alert] = "This one doesn't belong to you!"
        redirect_to coalitions_path
      end
    end  
end
