class HomesController < ActionController::Base 
  def show
    @user = User.new
  end
end
