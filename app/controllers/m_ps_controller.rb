class MPsController < ApplicationController
  before_action :set_mp, only: [:show, :edit, :update, :destroy]

  # GET /mps
  # GET /mps.json
  def index
    @mps = Mp.all
  end

  # GET /mps/1
  # GET /mps/1.json
  def show
  end

  # GET /mps/new
  def new
    @mp = Mp.new
  end

  # GET /mps/1/edit
  def edit
  end

  # POST /mps
  # POST /mps.json
  def create
    @mp = Mp.new(mp_params)

    respond_to do |format|
      if @mp.save
        format.html { redirect_to @mp, notice: 'Mp was successfully created.' }
        format.json { render :show, status: :created, location: @mp }
      else
        format.html { render :new }
        format.json { render json: @mp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mps/1
  # PATCH/PUT /mps/1.json
  def update
    respond_to do |format|
      if @mp.update(mp_params)
        format.html { redirect_to @mp, notice: 'Mp was successfully updated.' }
        format.json { render :show, status: :ok, location: @mp }
      else
        format.html { render :edit }
        format.json { render json: @mp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mps/1
  # DELETE /mps/1.json
  def destroy
    @mp.destroy
    respond_to do |format|
      format.html { redirect_to mps_url, notice: 'Mp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mp
      @mp = Mp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mp_params
      params.require(:mp).permit(:avatar, :full_name, :born, :telephone, :description, :web)
    end
end
