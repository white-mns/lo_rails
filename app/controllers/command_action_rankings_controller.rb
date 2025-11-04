class CommandActionRankingsController < ApplicationController
  include MyUtility
  before_action :set_command_action_ranking, only: [:show, :edit, :update, :destroy]

  # GET /command_action_rankings
  def index
    placeholder_set
    param_set
    @count	= CommandActionRanking.notnil().includes([card_data: :kind_name]).ransack(params[:q]).result.count()
    @search	= CommandActionRanking.notnil().includes([card_data: :kind_name]).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @command_action_rankings	= @search.result.per(50)
  end

  def param_set
    @latest_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end
    
    if params["rank_type"] == "1" then params["lv_form"] = nil end

    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_number_assign(params, "rank_type", "rank_type_form")
    reference_number_assign(params, "rank", "rank_form")
    reference_number_assign(params, "num", "num_form")

    reference_text_assign(params, "card_data_kind_name_name", "kind_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
    
    if params["rank_type"] == "1" then @all_lv      = "on" end
    if params["rank_type"] == "0" then @separate_lv = "on" end
    params[:q]["rank_type_eq_any"] ||= []
    if !params["is_form"] then
        @all_lv = "on"
    end
    if @all_lv       == "on" then params[:q]["rank_type_eq_any"].push(1) end
    if @separate_lv  == "on" then params[:q]["rank_type_eq_any"].push(0) end

    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @card_id_form = params["card_id_form"]
    @rank_type_form = params["rank_type_form"]
    @rank_form = params["rank_form"]
    @num_form = params["num_form"]
    
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]

    @rank_type = params["rank_type"]

    @show_detail_card_data = params["show_detail_card_data"]
    @show_detail_rank = params["show_detail_rank"]
  end
  # GET /command_action_rankings/1
  #def show
  #end

  # GET /command_action_rankings/new
  #def new
  #  @command_action_ranking = CommandActionRanking.new
  #end

  # GET /command_action_rankings/1/edit
  #def edit
  #end

  # POST /command_action_rankings
  #def create
  #  @command_action_ranking = CommandActionRanking.new(command_action_ranking_params)

  #  if @command_action_ranking.save
  #    redirect_to @command_action_ranking, notice: 'Command action ranking was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /command_action_rankings/1
  #def update
  #  if @command_action_ranking.update(command_action_ranking_params)
  #    redirect_to @command_action_ranking, notice: 'Command action ranking was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /command_action_rankings/1
  #def destroy
  #  @command_action_ranking.destroy
  #  redirect_to command_action_rankings_url, notice: 'Command action ranking was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_command_action_ranking
      @command_action_ranking = CommandActionRanking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def command_action_ranking_params
      params.require(:command_action_ranking).permit(:result_no, :generate_no, :card_id, :rank_type, :rank, :num)
    end
end
