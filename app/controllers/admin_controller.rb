class AdminController < ApplicationController
  before_action :authenticate_admin!, only: :index
  def index
  end
end