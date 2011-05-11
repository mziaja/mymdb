module ApplicationHelper
  
  def admin_or_user 
    return "admin" if admin_signed_in?
    return "user" if user_signed_in?
  end
  
  def sign_out_path
    return destroy_user_session_path if user_signed_in?
    return destroy_admin_session_path if admin_signed_in?
  end
  
end
