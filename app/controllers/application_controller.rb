class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = 'ログインに成功しました'
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_path, notice: '管理者権限がないためアクセスできません' }
    end
  end
end
