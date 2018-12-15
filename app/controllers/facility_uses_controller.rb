class FacilityUsesController < ApplicationController
  include MyUtility
  before_action :set_facility_use, only: [:show, :edit, :update, :destroy]

  # GET /facility_uses
  def index
    param_set
    @count	= FacilityUse.notnil().includes(:p_name, :facility_effect_name).search(params[:q]).result.count()
    @search	= FacilityUse.notnil().includes(:p_name, :facility_effect_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @facility_uses	= @search.result.per(50)
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
    reference_text_assign(params, "facility_name", "facility_name_form")
    reference_text_assign(params, "facility_effect_name_name", "facility_effect_form")
    reference_number_assign(params, "facility_lv", "facility_lv_form")
    reference_number_assign(params, "facility_e_no", "facility_e_no_form")
    reference_number_assign(params, "usage", "usage_form")
    reference_number_assign(params, "cost", "cost_form")
    reference_number_assign(params, "success", "success_form")
    
    params[:q]["success_eq_any"] ||= []
    if !params["is_form"] then
        params["is_success"] = "on"
        params["is_false"]   = "on"
    end
    if params["is_success"] == "on" then params[:q]["success_eq_any"].push(1) end
    if params["is_false"]   == "on" then params[:q]["success_eq_any"].push(-1) end

    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @facility_name_form = params["facility_name_form"]
    @facility_effect_form = params["facility_effect_form"]
    @facility_lv_form = params["facility_lv_form"]
    @facility_e_no_form = params["facility_e_no_form"]
    @usage_form = params["usage_form"]
    @cost_form = params["cost_form"]
    @success_form = params["success_form"]

    @is_success = params["is_success"]
    @is_false = params["is_false"]
  end
  # GET /facility_uses/1
  #def show
  #end

  # GET /facility_uses/new
  #def new
  #  @facility_use = FacilityUse.new
  #end

  # GET /facility_uses/1/edit
  #def edit
  #end

  # POST /facility_uses
  #def create
  #  @facility_use = FacilityUse.new(facility_use_params)

  #  if @facility_use.save
  #    redirect_to @facility_use, notice: 'Facility use was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /facility_uses/1
  #def update
  #  if @facility_use.update(facility_use_params)
  #    redirect_to @facility_use, notice: 'Facility use was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /facility_uses/1
  #def destroy
  #  @facility_use.destroy
  #  redirect_to facility_uses_url, notice: 'Facility use was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility_use
      @facility_use = FacilityUse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def facility_use_params
      params.require(:facility_use).permit(:result_no, :generate_no, :e_no, :facility_name, :facility_effect, :facility_lv, :facility_e_no, :usage, :cost, :success)
    end
end
