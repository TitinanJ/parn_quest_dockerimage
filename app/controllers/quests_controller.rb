class QuestsController < ApplicationController
  before_action :set_quest, only: %i[show edit update destroy toggle_complete]

  def index
    @quests = Quest.all.order(created_at: :desc)
    @quest = Quest.new
  end

  def show
  end

  def new
    @quest = Quest.new
  end

  def edit
  end

  def create
    @quest = Quest.new(quest_params)

    respond_to do |format|
      if @quest.save
        format.html { redirect_to root_path, notice: "Quest was successfully created." }
        format.json { render :show, status: :created, location: @quest }
      else
        format.html { redirect_to root_path, alert: "Error creating quest." }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to root_path, notice: "Quest was successfully updated." }
        format.json { render :show, status: :ok, location: @quest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quest.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Quest was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def toggle_complete
    @quest.update(status: !@quest.status)
    redirect_to root_path
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest_params
    params.require(:quest).permit(:name, :status)
  end
end
