class HostsController < ApplicationController
  def index
    render json: "welcome host"
  end
end
