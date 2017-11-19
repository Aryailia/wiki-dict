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
end
