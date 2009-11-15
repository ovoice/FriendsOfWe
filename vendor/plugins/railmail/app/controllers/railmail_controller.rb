class RailmailController < ActionController::Base
  layout 'railmail'
  before_filter :load_delivery, :except => [:index, :styles, :javascripts]
  
  def index    
    @deliveries = RailmailDelivery.find :all, :order => 'sent_at DESC',                           
                                              :limit  =>  30
  end
  
  def read
    @delivery.read_at = Time.now
    @delivery.save!
  end
  
  def raw
    render :text => @delivery.raw.to_s, :content_type => 'text/plain'
  end
  
  def part
    @raw = @delivery.raw
    @mime = params[:part]
    
    @part = @raw.parts.select {|p| p.content_type == @mime }.first
    render :text => @part.body.to_s, :content_type => @mime
  end
  
  private  
  def load_delivery
    @delivery = RailmailDelivery.find params[:id]
  end
end