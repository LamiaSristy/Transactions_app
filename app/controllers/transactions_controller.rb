class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:view]
      @t1 = Transaction.with_group(current_user.id).ordered_by_most_recent
      render 'one_page'
    else
      @t2 = Transaction.without_group(current_user.id).ordered_by_most_recent
      render 'another_page'
    end
  end

  def new
    @transaction = Transaction.new
  end

  def create
    group = Group.where(name: params['group_id']).first
    @transaction = Transaction.new(transaction_param)
    @transaction.author_id = current_user.id
    if @transaction.save
      redirect_to root_path, notice: 'New transaction was successfully created.'
    else
     render :new
    end
  end

  def show
    @transaction= Transaction.find(params[:id])
  end

  def edit
    @transaction= Transaction.find(params[:id])
  end

  def update
    @transaction= Transaction.find(params[:id])
    @transaction.update(transaction_param)
    redirect_to transaction_path(@ransaction)
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    flash[:notice] = "Transaction successfully Deleted"
    redirect_to root_path
  end

  private

  def transaction_param
    params.require(:transaction).permit(:name, :amount, :group_id)
  end
  
end
