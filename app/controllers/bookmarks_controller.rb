class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    # raise
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity, notice: 'Error'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    # raise
    @bookmark.destroy
    redirect_to list_path(@bookmark), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
