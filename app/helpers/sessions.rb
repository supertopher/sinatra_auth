helpers do

  def current_user
    true if session[:user]
  end

end

    # User.find(session[:user]) if session[:user]
#  this does that too... i did it elsewhere