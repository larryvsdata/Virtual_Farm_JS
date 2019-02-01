module ApplicationHelper
  def current_owner
    Owner.find_by_id(session[:owner_id]) if is_signed_in?
  end

  def is_signed_in?
    !!session[:owner_id]
  end
end
