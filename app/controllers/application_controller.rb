class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    # 新規登録時に user_name というパラメータがデータベースに登録できるようになる
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    # 編集時に user_name というパラメータがデータベースに登録できるようになる
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])
  end
end
