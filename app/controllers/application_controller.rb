class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ログイン済ユーザにのみ、アクセス許可
  before_action :authenticate_user!
  
end
