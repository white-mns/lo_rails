class MeddlingSuccessRatesController < ApplicationController
  include MyUtility
  before_action :set_meddling_success_rate, only: [:show, :edit, :update, :destroy]

  # GET /meddling_success_rates
  def index
    param_set
    @count	= MeddlingSuccessRate.notnil().includes(:p_name, :card_data, :targets).search(params[:q]).result.count()
    @search	= MeddlingSuccessRate.notnil().includes(:p_name, :card_data, :targets).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @meddling_success_rates	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params[:q] ||= {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    if params["show_detail_chain"] == "1" then
        params[:q]["chain_not_eq"] = -1
        params[:q]["chain_eq"] = ""
    else
        params["chain_form"] = ""
        params[:q]["chain_eq"] = -1
        params[:q]["chain_not_eq"] = ""
    end

    if params["show_detail_e_no"] == "1" then
        params[:q]["e_no_eq"] = ""
        if params["all_rate"] != "on" then
            params[:q]["e_no_not_eq"] = 0
        end
    else
        params["all_rate"] = "on"
        params[:q]["e_no_eq"] = 0
        params[:q]["e_no_not_eq"] = ""
        params["e_no_form"] = ""
        params["p_name_form"] = ""
    end

    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_number_assign(params, "chain", "chain_form")
    reference_number_assign(params, "success", "success_form")
    reference_number_assign(params, "miss", "miss_form")
    reference_number_assign(params, "no_apply", "no_apply_form")
    reference_number_assign(params, "sum", "sum_form")
    reference_number_assign(params, "rate", "rate_form")
    
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
    reference_text_assign(params, "targets_target_data_name", "targets_form")

    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @card_id_form = params["card_id_form"]
    @chain_form = params["chain_form"]
    @success_form = params["success_form"]
    @miss_form = params["miss_form"]
    @no_apply_form = params["no_apply_form"]
    @sum_form = params["sum_form"]
    @rate_form = params["rate_form"]
    
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]
    @lpfp_form = params["lpfp_form"]
    @targets_form = params["targets_form"]

    @show_detail_chain = params["show_detail_chain"]
    @show_detail_e_no = params["show_detail_e_no"]
    @all_rate = params["all_rate"]
    @show_detail_target = params["show_detail_target"]
    @show_detail_link = params["show_detail_link"]
    @base_first    = (!params["is_form"]) ? "1" : "0"
  end
  # GET /meddling_success_rates/1
  #def show
  #end

  # GET /meddling_success_rates/new
  #def new
  #  @meddling_success_rate = MeddlingSuccessRate.new
  #end

  # GET /meddling_success_rates/1/edit
  #def edit
  #end

  # POST /meddling_success_rates
  #def create
  #  @meddling_success_rate = MeddlingSuccessRate.new(meddling_success_rate_params)

  #  if @meddling_success_rate.save
  #    redirect_to @meddling_success_rate, notice: 'Meddling success rate was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /meddling_success_rates/1
  #def update
  #  if @meddling_success_rate.update(meddling_success_rate_params)
  #    redirect_to @meddling_success_rate, notice: 'Meddling success rate was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /meddling_success_rates/1
  #def destroy
  #  @meddling_success_rate.destroy
  #  redirect_to meddling_success_rates_url, notice: 'Meddling success rate was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meddling_success_rate
      @meddling_success_rate = MeddlingSuccessRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meddling_success_rate_params
      params.require(:meddling_success_rate).permit(:result_no, :generate_no, :e_no, :card_id, :chain, :success, :miss, :no_apply, :sum, :rate)
    end
end
