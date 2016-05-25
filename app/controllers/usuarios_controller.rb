class UsuariosController < ApplicationController

  PER_PAGE = 10

  before_filter :login_required

  def index
    puts "Usuario"
  end

  private

  def login_required
    redirect_to root_path unless logged_in?
  end

end
