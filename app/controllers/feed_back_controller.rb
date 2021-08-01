class FeedBackController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def create
    FeedBackMailer.create(params[:message]).deliver_now
    flash[:notice] = t('.success')
    render :index
  end

end
