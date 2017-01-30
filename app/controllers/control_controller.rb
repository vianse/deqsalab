class ControlController < ApplicationController
  def index
  	if user_signed_in?
  		redirect_to "/archivos"
  	else
  		redirect_to "/archivos/new"
  	end

  end
end
