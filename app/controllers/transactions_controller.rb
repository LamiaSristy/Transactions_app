class TransactionsController < ApplicationController
    before_action :authenticate_user!

  def index 
    @t1 = Transaction.with_group.ordered_by_most_recent
    @t2 = Transaction.without_group.ordered_by_most_recent 
    if params[:view]
      render 'one_page'
    else
      render 'another_page'
    end
  end

  def new
    @transaction = Transaction.new
  end

  def create

    group = Group.where(name: params['group_id']).first
    @transaction = Transaction.new(transaction_param)
    # @transaction.name = params[:name]
    # @transaction.amount = 11 #params[:amount]
    @transaction.author_id = current_user.id
    # @transaction.group_id = 1 #params['group_id']
    if @transaction.save
      redirect_to transactions_path, notice: 'New transaction was successfully created.'
    else
     render :new
    end
  end

  private

  def transaction_param
    params.require(:transaction).permit(:name, :amount, :group_id)
  end
  
end
