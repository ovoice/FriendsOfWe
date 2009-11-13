class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.all
  end
  
  def show
    @opportunity = Opportunity.find(params[:id])
  end
  
  def new
    @opportunity = Opportunity.new
  end
  
  def create
    @opportunity = Opportunity.new(params[:opportunity])
    if @opportunity.save
      flash[:notice] = "Successfully created opportunity."
      redirect_to @opportunity
    else
      render :action => 'new'
    end
  end
  
  def edit
    @opportunity = Opportunity.find(params[:id])
  end
  
  def update
    @opportunity = Opportunity.find(params[:id])
    if @opportunity.update_attributes(params[:opportunity])
      flash[:notice] = "Successfully updated opportunity."
      redirect_to @opportunity
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @opportunity = Opportunity.find(params[:id])
    @opportunity.destroy
    flash[:notice] = "Successfully destroyed opportunity."
    redirect_to opportunities_url
  end
end
