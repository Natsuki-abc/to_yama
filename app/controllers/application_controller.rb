class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました"
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private
  # def not_authenticated
  #   flash[:notice] = 'ログインしてください'
  #   redirect_to main_app.login_path #main_appのプレフィックスをつける
  # end
end
