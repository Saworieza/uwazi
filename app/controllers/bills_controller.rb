class BillsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  #ensure only owner edits or deletes
  before_action :owned_bill, only: [:edit, :update, :destroy]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.order("created_at DESC")
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    @bill = Bill.find(params[:id])
    #@comment = Bill.comments.find(params[:id])
    @new_comment = Comment.build_from(@bill, current_user.id, "")
    
 
  end

  # GET /bills/new
  def new
    @bill = current_user.bills.build
    #@bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
     @bill = current_user.bills.build(bill_params)
     
     if @bill.save
      flash[:success] = "Bill has been created!"
      redirect_to posts_path
     else
      flash[:alert] = "Your bill couldn't be created!  Please check the form."
      render :new
     end
     #@bill = Bill.find(params[:id])
     #redirect_to root_path, notice: 'Thou Shalt Nought duuu dat :(' unless current_user.id == @bill.user_id
      
    #unless current_user == @bill.user
      #redirect_to(@bill, notice: "You cannot edit this prayer") and return
    #end
  end
  
  def upvote
    @bill = Bill.find(params[:id])
    @bill.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @bill = Bill.find(params[:id])
    @bill.downvote_by current_user
    redirect_to :back
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = current_user.bills.build(bill_params)
    #@bill = Bill.new(bill_params)
     @bill.document = params[:bill][:document]
    
    respond_to do |format|
      if @bill.save
        #respond_with @bill
        
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:document, :title, :summary, :date, :politician_id)
    end
    
    def owned_bill  
      unless current_user == @bill.user
        flash[:alert] = "That bill doesn't belong to you!"
        redirect_to bills_path
      end
    end  
end
