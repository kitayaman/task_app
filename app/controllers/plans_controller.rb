class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(params.require(:plan).permit(:title, :start_date, :finish_date, :all_day, :memo))
    if @plan.save
      flash[:notice] = "新しいスケジュールを作りました"
      redirect_to :plans
    else
      flash[:alert] = "登録できませんでした"
      render 'new'
    end
  end
  
  
  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
      if @plan.update(params.require(:plan).permit(:title, :start_date, :finish_date, :all_day, :memo))
        flash[:notice] = "スケジュールID [ #{@plan.id} ] の情報を更新しました"
        redirect_to :plans
      else
        flash[:alert] = "更新できませんでした"
        render 'edit'
      end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
      flash[:notice] = 'スケジュールを削除しました'
      redirect_to :plans   
  end
  
  
  
  

end
