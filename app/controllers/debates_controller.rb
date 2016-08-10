class DebatesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_debate, only: [:show, :edit, :update, :destroy]

  # GET /debates
  # GET /debates.json
  def index
    @debates = Debate.all
  end

  # GET /debates/1
  # GET /debates/1.json
  def show
    @debate = Debate.find(params[:id])
    @new_comment = Comment.build_from(@debate, 1, "")
  end

  # GET /debates/new
  def new
    @debate = current_user.debates.build
  end

  # GET /debates/1/edit
  def edit
  end


  def upvote
    @debate = Debate.find(params[:id])
    @debate.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @debate = Deabte.find(params[:id])
    @debate.downvote_by current_user
    redirect_to :back
  end

  # POST /debates
  # POST /debates.json
  def create
    @debate = current_user.debates.build(debate_params)

    respond_to do |format|
      if @debate.save
        format.html { redirect_to @debate, notice: 'Debate was successfully created.' }
        format.json { render :show, status: :created, location: @debate }
      else
        format.html { render :new }
        format.json { render json: @debate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debates/1
  # PATCH/PUT /debates/1.json
  def update
    respond_to do |format|
      if @debate.update(debate_params)
        format.html { redirect_to @debate, notice: 'Debate was successfully updated.' }
        format.json { render :show, status: :ok, location: @debate }
      else
        format.html { render :edit }
        format.json { render json: @debate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debates/1
  # DELETE /debates/1.json
  def destroy
    @debate.destroy
    respond_to do |format|
      format.html { redirect_to debates_url, notice: 'Debate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debate
      @debate = Debate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debate_params
      params.require(:debate).permit(:title, :category_id, :user_id)
    end
end
