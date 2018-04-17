class CommentsController < ApplicationController
  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @my_thread.comments.create(strong_para_comment)
    # スレッド詳細画面にリダイレクト
    redirect_to my_thread_path(id: @my_thread.id)
  end

  private
  def strong_para_comment
    params.require(:comment).permit(:body)
  end
  public

  def edit
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
  end

  def update
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
    if @comment.update(strong_para_comment)
      redirect_to my_thread_path(id: @my_thread.id)
    else
      render 'edit'
    end
  end

  def destroy
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
    @comment.destroy
    redirect_to my_thread_path(id: @my_thread.id)
  end

end
