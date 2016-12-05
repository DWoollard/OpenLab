class VideosController < ApplicationController
  def create
    @video = Video.new(video_params)
    return redirect_to @video.project, notice: 'Video was successfully posted.' if @video.save
    redirect_to @video.project
  end

  def update
    if @video.update(video_params)
      return redirect_to @video.project, notice: 'Video was successfully updated.' if @video.save
      redirect_to @video.project
    end
  end

  def destroy
    @video.destroy
    redirect_to projects_url, notice: 'Video was successfully destroyed.'
  end

  private

  def video_params
    params.require(:video).permit(:youtube_link, :project_id)
  end
end
