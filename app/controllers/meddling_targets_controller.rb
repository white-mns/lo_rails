class MeddlingTargetsController < ApplicationController
  include MyUtility
  before_action :set_meddling_target, only: [:show, :edit, :update, :destroy]

  # GET /meddling_targets
  def index
    param_set
    @count	= MeddlingTarget.notnil().includes(:p_name, :card_data, :target_data).search(params[:q]).result.count()
    @search	= MeddlingTarget.notnil().includes(:p_name, :card_data, :target_data).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @meddling_targets	= @search.result.per(50)
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

    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_number_assign(params, "chain", "chain_form")
    reference_number_assign(params, "target_id", "target_id_form")
    reference_number_assign(params, "count", "count_form")
    
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
    reference_number_assign(params, "card_data_lpfp", "fp_form")
    reference_text_assign(params, "target_data_name", "target_form")
    reference_number_assign(params, "target_data_lv", "target_lv_form")
    reference_number_assign(params, "target_data_lp", "target_lp_form")
    reference_number_assign(params, "target_data_fp", "target_fp_form")
    reference_number_assign(params, "target_data_lpfp", "target_fp_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @card_id_form = params["card_id_form"]
    @chain_form = params["chain_form"]
    @target_id_form = params["target_id_form"]
    @count_form = params["count_form"]
    
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]
    @lpfp_form = params["lpfp_form"]
    @target__form = params["target_form"]
    @target_lv_form = params["target_lv_form"]
    @target_lp_form = params["target_lp_form"]
    @target_fp_form = params["target_fp_form"]
    @target_lpfp_form = params["target_lpfp_form"]
    
    @show_detail_chain = params["show_detail_chain"]
    @show_detail_card = params["show_detail_card"]
    @show_detail_target = params["show_detail_target"]
  end
  # GET /meddling_targets/1
  #def show
  #end

  # GET /meddling_targets/new
  #def new
  #  @meddling_target = MeddlingTarget.new
  #end

  # GET /meddling_targets/1/edit
  #def edit
  #end

  # POST /meddling_targets
  #def create
  #  @meddling_target = MeddlingTarget.new(meddling_target_params)

  #  if @meddling_target.save
  #    redirect_to @meddling_target, notice: 'Meddling target was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /meddling_targets/1
  #def update
  #  if @meddling_target.update(meddling_target_params)
  #    redirect_to @meddling_target, notice: 'Meddling target was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /meddling_targets/1
  #def destroy
  #  @meddling_target.destroy
  #  redirect_to meddling_targets_url, notice: 'Meddling target was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meddling_target
      @meddling_target = MeddlingTarget.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meddling_target_params
      params.require(:meddling_target).permit(:result_no, :generate_no, :e_no, :card_id, :chain, :target_id, :count)
    end
end
