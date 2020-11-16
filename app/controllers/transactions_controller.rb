class TransactionsController < ApplicationController
    before_action :authenticate_user!

  def index 
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create 
    @transaction = Transaction.new(transaction_param)
    @transaction.user = current_user
    # if @group.save
    #   redirect_to user_groups_path, notice: 'Group was successfully created.'
    # else
    #   render :new
    # end
  end

  private

  def transaction_param
    params.require(:transaction).permit(:name, :amount)
  end
end
