class adminsController < ApplicationController
def root
  if user_signed_in?
    redirect_to root_for_signed_in_admin_path (or whatever)
  else
    redirect_to new_admin_session_path
  end
end
