class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :latest_vehicles

  # layout :choose_layout

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  private

  def require_user
    unless current_user
      flash[:notice] = 'You must be signed in'
      redirect_to root_path
      false
    end
  end

  def latest_vehicles
    @latest = Car.shipped.limit(3)
  end

  # def choose_layout
  #   current_user.present? ? 'with_user' : 'without_user'
  # end
end
