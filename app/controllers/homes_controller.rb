class HomesController < ApplicationController
  def show
    @user = User.new
  end
end
