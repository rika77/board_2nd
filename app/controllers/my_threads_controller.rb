class MyThreadsController < ApplicationController
  # actionの設定
  def index
    # 配列すね
    @my_threads = MyThread.all.order(created_at: 'desc')
  end

  def show
    # 一覧から、一つを選んだ時にtitle及びコメントなどを一覧表示する
    # rails routesによると、#indexでidが渡ってくるので
    @my_thread = MyThread.find(params[:id])
  end

  def new
    #@my_thread = MyThread.find(params[:my_thread_id])
  end

  # フォームの入力が来る
  def create
    # データをsaveして、一覧画面にredirect
    # save
    @my_thread = MyThread.new(strong_para_thread)
    @my_thread.save
    # redirect
    redirect_to my_threads_path
  end

  private
  def strong_para_thread
    params.require(:my_thread).permit(:title, :body)
  end
  public

  def edit
    @my_thread = MyThread.find(params[:id])
  end

  def update
    @my_thread = MyThread.find(params[:id])
    if @my_thread.update(strong_para_thread)
      redirect_to my_threads_path
    else
      render 'edit'
    end
  end

  def destroy
    @my_thread = MyThread.find(params[:id])
    @my_thread.destroy
    redirect_to my_threads_path
  end
end
