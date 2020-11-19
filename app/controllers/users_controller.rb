class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @expense_per_group = Transaction.expense_per_group(current_user.id)
  end

  def show
    # @user = User.find(params[:id])
  end
end
