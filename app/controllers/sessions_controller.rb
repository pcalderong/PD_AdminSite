class SessionsController < ApplicationController

  # Handle Google OAuth 2.0 login callback.
  #
  # GET /auth/google_oauth2/callback
  def create
    user_info = request.env["omniauth.auth"]

    user           = Usuario.new
    user.id        = user_info["uid"]
    user.name      = user_info["info"]["name"]
    user.image_url = user_info["info"]["image"]

    session[:usuario] = Marshal.dump user
    puts "SE: #{session[:usuario]}"
    session_load = Marshal.load(session[:usuario])
    puts "LO:#{session_load}"
    session[:usuario] = Marshal.dump user
    redirect_to root_path
  end
# [END create]

  # [START destroy]
  def destroy
    session.delete :usuario

    redirect_to root_path
  end
  # [END destroy]

end
