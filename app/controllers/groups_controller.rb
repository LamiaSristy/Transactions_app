class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @groups = Group.all.find_by_first_letter(params[:letter])
  end

  def new
    @group = Group.new
  end

  def create 
    @group = Group.new(group_param)
    @group.user = current_user
    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])  
  end

  private

  def group_param
    params.require(:group).permit(:name, :icon)
  end
end
