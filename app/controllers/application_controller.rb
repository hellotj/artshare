class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include PublicActivity::StoreController
  # ...
   hide_action :current_user

  protected

   def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:account_update) << :name
      devise_parameter_sanitizer.for(:user) << :avatar
   end

  def after_sign_in_path_for(resource_or_scope)
      home_index_path
  end

  # def after_sign_out_path_for(resource_or_scope)
  #   home_index  
  # end

end
