module ApplicationHelper
  def signed_in?
    !session[:current_user_id].nil?
  end

  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def sign_in(id)
    session[:current_user_id] = id
  end

  def sign_out
    session[:current_user_id] = nil
  end

  def require_login
    if !signed_in?
      msg = 'You must be logged in to perform this action'
      respond_to do |format|
        format.html { redirect_to(login_path, notice: msg) }
        format.json { render(errors: msg, status: :unprocessable_entity) }
      end
    end
  end
  
  def require_admin
    if current_user.nil? || !current_user.admin?
      msg = 'You must be an admin to perform this action'
      respond_to do |format|
        format.html { redirect_to(root_path, notice: msg) }
        format.json { render(errors: msg, status: :unprocessable_entity) }
      end
    end
  end
end
