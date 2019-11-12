class AdminsController < ApplicationController
  def index
    @users = User.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins
      @users = User.find(params[:id])
    end
end
