class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    @song = Song.find(params[:id]).destroy
    @song.destroy
    redirect_to songs_path
  end



private

def song_params()
  params.require(:song).permit(:title, :genre, :release_year, :artist_name, :released)
end

end
