class DashboardsController < ApplicationController
  def show
    @task = Task.new
  end
end
