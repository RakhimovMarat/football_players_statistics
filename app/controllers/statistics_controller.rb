class StatisticsController < ApplicationController
  def create
    @statistic = Statistic.new(statistic_params)
    if @statistic.save
      render json: @statistic, status: :created
    else
      render json: @statistic.errors, status: :unprocessable_entity
    end
  end

  private

  def statistic_params
    params.require(:statistic).permit(:saves, :clean_sheets, :goals,
                                      :assists, :shots, :shots_on_target,
                                      :tackles, :passes, :yellow_cards,
                                      :player_id, :match_id,:role_id)
  end
end
