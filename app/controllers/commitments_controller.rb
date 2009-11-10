class CommitmentsController < ApplicationController
  def index
    @commitments = Commitment.all
  end
  
  def show
    @commitment = Commitment.find(params[:id])
  end
  
  def new
    @commitment = Commitment.new
  end
  
  def create
    @commitment = Commitment.new(params[:commitment])
    if @commitment.save
      flash[:notice] = "Successfully created commitment."
      redirect_to @commitment
    else
      render :action => 'new'
    end
  end
  
  def edit
    @commitment = Commitment.find(params[:id])
  end
  
  def update
    @commitment = Commitment.find(params[:id])
    if @commitment.update_attributes(params[:commitment])
      flash[:notice] = "Successfully updated commitment."
      redirect_to @commitment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @commitment = Commitment.find(params[:id])
    @commitment.destroy
    flash[:notice] = "Successfully destroyed commitment."
    redirect_to commitments_url
  end
end
