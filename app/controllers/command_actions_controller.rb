class CommandActionsController < ApplicationController
  include MyUtility
  before_action :set_command_action, only: [:show, :edit, :update, :destroy]

  # GET /command_actions
  def index
    param_set
    @count	= CommandAction.notnil().includes(:p_name, [card_data: :kind_name], :timing_name, :gowait_name).search(params[:q]).result.count()
    @search	= CommandAction.notnil().includes(:p_name, [card_data: :kind_name], :timing_name, :gowait_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @command_actions	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params[:q] ||= {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "act", "act_form")
    reference_number_assign(params, "s_no", "s_no_form")
    reference_text_assign(params, "timing_name_name", "timing_form")
    reference_text_assign(params, "gowait_name_name", "gowait_form")
    reference_number_assign(params, "card_id", "card_id_form")

    reference_text_assign(params, "card_data_kind_name_name", "kind_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @act_form = params["act_form"]
    @s_no_form = params["s_no_form"]
    @timing_form = params["timing_form"]
    @gowait_form = params["gowait_form"]
    @card_id_form = params["card_id_form"]
    
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]
  end
  # GET /command_actions/1
  #def show
  #end

  # GET /command_actions/new
  #def new
  #  @command_action = CommandAction.new
  #end

  # GET /command_actions/1/edit
  #def edit
  #end

  # POST /command_actions
  #def create
  #  @command_action = CommandAction.new(command_action_params)

  #  if @command_action.save
  #    redirect_to @command_action, notice: 'Command action was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /command_actions/1
  #def update
  #  if @command_action.update(command_action_params)
  #    redirect_to @command_action, notice: 'Command action was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /command_actions/1
  #def destroy
  #  @command_action.destroy
  #  redirect_to command_actions_url, notice: 'Command action was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_command_action
      @command_action = CommandAction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def command_action_params
      params.require(:command_action).permit(:result_no, :generate_no, :e_no, :act, :s_no, :timing, :gowait, :card_id)
    end
end
