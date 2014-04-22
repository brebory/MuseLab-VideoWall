class VideoController < ApplicationController
  def list
    @videos = Video.find :all
  end

  def show
    @video = Video.find params[:id]
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new params[:video]
    @video.save
    redirect_to "/video/#{@video.id}"
  end

  def edit
    @video = Video.find params[:id]
  end

  def update
    @video = Video.find params[:id]  
    @video.update_attributes params[:video]
  end
end
