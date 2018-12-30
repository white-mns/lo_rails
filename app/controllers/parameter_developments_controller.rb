class ParameterDevelopmentsController < ApplicationController
  include MyUtility
  before_action :set_parameter_development, only: [:show, :edit, :update, :destroy]

  # GET /parameter_developments
  def index
    placeholder_set
    param_set
    @count	= ParameterDevelopment.notnil().includes(:p_name, :cond_name).search(params[:q]).result.count()
    @search	= ParameterDevelopment.notnil().includes(:p_name, :cond_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @parameter_developments	= @search.result.per(50)
  end

  # GET /conditions
  def conditions
    param_set
    @count	= ParameterDevelopment.notnil().includes(:p_name, [last_parameter: :cond_name], [parameter_control: :cond_name],  :cond_name, :item_use, :facility_use_1, :facility_use_2, :dice_1, :dice_2, :development_result, :place).search(params[:q]).result.count()
    @search	= ParameterDevelopment.notnil().includes(:p_name, [last_parameter: :cond_name], [parameter_control: :cond_name],  :cond_name, :item_use, :facility_use_1, :facility_use_2, :dice_1, :dice_2, :development_result, :place).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @conditions	= @search.result.per(50)
  end

  def param_set
    @latest_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "lv", "lv_form")
    reference_number_assign(params, "rank", "rank_form")
    reference_number_assign(params, "mlp", "mlp_form")
    reference_number_assign(params, "mfp", "mfp_form")
    reference_text_assign(params, "cond_name_name", "cond_form")
    
    reference_number_assign(params, "development_result_bellicose", "bellicose_form")
    reference_number_assign(params, "development_result_party_num", "party_num_form")
    reference_number_assign(params, "place_invation_lv", "invation_lv_form")
    reference_number_assign(params, "facility_use_1_recovery_lv", "facility_use_1_recovery_lv_form")
    reference_number_assign(params, "facility_use_2_recovery_lv", "facility_use_2_recovery_lv_form")
    reference_number_assign(params, "item_use_recovery_lv", "item_use_recovery_lv_form")

    cond = ProperName.pluck(:name, :proper_id).inject(Hash.new(0)){|hash, a| hash[a[0]] = a[1] ; hash}

    params[:q]["last_parameter_cond_eq_any"] = []
    if params["last_parameter_cond_over"]      == "on" then params[:q]["last_parameter_cond_eq_any"].push(cond["OVER"]) end
    if params["last_parameter_cond_good"]      == "on" then params[:q]["last_parameter_cond_eq_any"].push(cond["GOOD"]) end
    if params["last_parameter_cond_not_good"]  == "on" then params[:q]["last_parameter_cond_eq_any"].push(cond["NOT GOOD"]) end
    if params["last_parameter_cond_not_good"]  == "on" then params[:q]["last_parameter_cond_eq_any"].push(cond["NORMAL"]) end
    if params["last_parameter_cond_bad"]       == "on" then params[:q]["last_parameter_cond_eq_any"].push(cond["BAD"]) end
    if params["last_parameter_cond_worst"]     == "on" then params[:q]["last_parameter_cond_eq_any"].push(cond["WORST"]) end

    params[:q]["parameter_control_cond_eq_any"] = []
    if params["parameter_control_cond_over"]      == "on" then params[:q]["parameter_control_cond_eq_any"].push(cond["OVER"]) end
    if params["parameter_control_cond_good"]      == "on" then params[:q]["parameter_control_cond_eq_any"].push(cond["GOOD"]) end
    if params["parameter_control_cond_not_good"]  == "on" then params[:q]["parameter_control_cond_eq_any"].push(cond["NOT GOOD"]) end
    if params["parameter_control_cond_not_good"]  == "on" then params[:q]["parameter_control_cond_eq_any"].push(cond["NORMAL"]) end
    if params["parameter_control_cond_bad"]       == "on" then params[:q]["parameter_control_cond_eq_any"].push(cond["BAD"]) end
    if params["parameter_control_cond_worst"]     == "on" then params[:q]["parameter_control_cond_eq_any"].push(cond["WORST"]) end

    params[:q]["cond_name_name_eq_any"] = []
    if params["cond_over"]      == "on" then params[:q]["cond_name_name_eq_any"].push("OVER") end
    if params["cond_good"]      == "on" then params[:q]["cond_name_name_eq_any"].push("GOOD") end
    if params["cond_not_good"]  == "on" then params[:q]["cond_name_name_eq_any"].push("NOT GOOD") end
    if params["cond_not_good"]  == "on" then params[:q]["cond_name_name_eq_any"].push("NORMAL") end
    if params["cond_bad"]       == "on" then params[:q]["cond_name_name_eq_any"].push("BAD") end
    if params["cond_worst"]     == "on" then params[:q]["cond_name_name_eq_any"].push("WORST") end
    
    if params["facility_1_no_recovery"] == "on" then params[:q]["facility_use_1_recovery_lv_blank"] = true end
    if params["facility_2_no_recovery"] == "on" then params[:q]["facility_use_2_recovery_lv_blank"] = true end
    if params["item_no_recovery"] == "on" then params[:q]["item_use_recovery_lv_blank"] = true end

    params[:q]["dice_1_dice_eq_any"] = []
    if params["dice_no_recovery_1"]  == "on" then params[:q]["dice_1_dice_eq_any"] = [1,2,3,4,5,6] end
    if params["dice_recovery_1"]     == "on" then params[:q]["dice_1_dice_eq_any"].push(0) end

    params[:q]["dice_2_dice_eq_any"] = []
    if params["dice_no_recovery_2"]  == "on" then params[:q]["dice_2_dice_eq_any"] = [1,2,3,4,5,6] end
    if params["dice_recovery_2"]     == "on" then params[:q]["dice_2_dice_eq_any"].push(0) end
        
    params[:q]["development_result_development_result_eq_any"] ||= []
    if params["result_win"]  == "on" then params[:q]["development_result_development_result_eq_any"].push(1) end
    if params["result_draw"] == "on" then params[:q]["development_result_development_result_eq_any"].push(0) end
    if params["result_lose"] == "on" then params[:q]["development_result_development_result_eq_any"].push(-1) end
 
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @lv_form = params["lv_form"]
    @rank_form = params["rank_form"]
    @mlp_form = params["mlp_form"]
    @mfp_form = params["mfp_form"]
    @cond_form = params["cond_form"]

    @bellicose_form = params["bellicose_form"]
    @party_num_form = params["party_num_form"]
    @invation_lv_form = params["invation_lv_form"]
    @facility_use_1_recovery_lv_form = params["facility_use_1_recovery_lv_form"]
    @facility_use_2_recovery_lv_form = params["facility_use_2_recovery_lv_form"]
    @item_use_recovery_lv_form = params["item_use_recovery_lv_form"]

    @last_parameter_cond_over     = params["last_parameter_cond_over"]
    @last_parameter_cond_good     = params["last_parameter_cond_good"]
    @last_parameter_cond_not_good = params["last_parameter_cond_not_good"]
    @last_parameter_cond_bad      = params["last_parameter_cond_bad"]
    @last_parameter_cond_worst    = params["last_parameter_cond_worst"]

    @parameter_control_cond_over     = params["parameter_control_cond_over"]
    @parameter_control_cond_good     = params["parameter_control_cond_good"]
    @parameter_control_cond_not_good = params["parameter_control_cond_not_good"]
    @parameter_control_cond_bad      = params["parameter_control_cond_bad"]
    @parameter_control_cond_worst    = params["parameter_control_cond_worst"]

    @cond_over     = params["cond_over"]
    @cond_good     = params["cond_good"]
    @cond_not_good = params["cond_not_good"]
    @cond_bad      = params["cond_bad"]
    @cond_worst    = params["cond_worst"]

    @facility_1_no_recovery  = params["facility_1_no_recovery"]
    @facility_2_no_recovery  = params["facility_2_no_recovery"]
    @item_no_recovery  = params["item_no_recovery"]

    @dice_recovery_1     = params["dice_recovery_1"]
    @dice_no_recovery_1  = params["dice_no_recovery_1"]

    @dice_recovery_2     = params["dice_recovery_2"]
    @dice_no_recovery_2  = params["dice_no_recovery_2"]

    @result_win = params["result_win"]
    @result_draw = params["result_draw"]
    @result_lose = params["result_lose"]

    @show_detail_invation_lv  = params["show_detail_invation_lv"]
  end
  # GET /parameter_developments/1
  #def show
  #end

  # GET /parameter_developments/new
  #def new
  #  @parameter_development = ParameterDevelopment.new
  #end

  # GET /parameter_developments/1/edit
  #def edit
  #end

  # POST /parameter_developments
  #def create
  #  @parameter_development = ParameterDevelopment.new(parameter_development_params)

  #  if @parameter_development.save
  #    redirect_to @parameter_development, notice: 'Parameter development was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /parameter_developments/1
  #def update
  #  if @parameter_development.update(parameter_development_params)
  #    redirect_to @parameter_development, notice: 'Parameter development was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /parameter_developments/1
  #def destroy
  #  @parameter_development.destroy
  #  redirect_to parameter_developments_url, notice: 'Parameter development was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter_development
      @parameter_development = ParameterDevelopment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parameter_development_params
      params.require(:parameter_development).permit(:result_no, :generate_no, :e_no, :lv, :rank, :mlp, :mfp, :cond)
    end
end
