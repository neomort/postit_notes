class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
# Note.create(author: params[:note][:author])
if @note.save
  redirect_to notes_path
else
  render :new
end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(notes_params)
      redirect_to notes_path
    else
      render :edit
    end

  end

  def destroy
Note.find(params[:id]).destroy
redirect_to notes_path
  end

  private
#sanitizer-- makes it so only these values can be added to database
  def notes_params
    params.require(:note).permit(:title, :author, :body)
  end
end
#first check input then send it to database
