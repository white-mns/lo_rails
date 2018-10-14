class ManufacturesController < ApplicationController
  include MyUtility
  before_action :set_manufacture, only: [:show, :edit, :update, :destroy]

  # GET /manufactures
  def index
    param_set
    @count	= Manufacture.notnil().includes(:p_name, :facility_effect_name, :kind_name, :effect_name).search(params[:q]).result.count()
    @search	= Manufacture.notnil().includes(:p_name, :facility_effect_name, :kind_name, :effect_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @manufactures	= @search.result.per(50)
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
    reference_text_assign(params, "facility_name", "facility_name_form")
    reference_text_assign(params, "facility_effect_name_name", "facility_effect_form")
    reference_number_assign(params, "facility_lv", "facility_lv_form")
    reference_number_assign(params, "facility_e_no", "facility_e_no_form")
    reference_text_assign(params, "item_name", "item_name_form")
    reference_number_assign(params, "usage", "usage_form")
    reference_number_assign(params, "cost", "cost_form")
    reference_text_assign(params, "kind_name_name", "kind_form")
    reference_text_assign(params, "effect_name_name", "effect_form")
    reference_number_assign(params, "effect_lv", "effect_lv_form")
    reference_number_assign(params, "potency", "potency_form")
    reference_number_assign(params, "precision", "precision_form")
    reference_number_assign(params, "total", "total_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @facility_name_form = params["facility_name_form"]
    @facility_effect_form = params["facility_effect_form"]
    @facility_lv_form = params["facility_lv_form"]
    @facility_e_no_form = params["facility_e_no_form"]
    @item_name_form = params["item_name_form"]
    @usage_form = params["usage_form"]
    @cost_form = params["cost_form"]
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @effect_lv_form = params["effect_lv_form"]
    @potency_form = params["potency_form"]
    @precision_form = params["precision_form"]
    @total_form = params["total_form"]
  end
  # GET /manufactures/1
  #def show
  #end

  # GET /manufactures/new
  #def new
  #  @manufacture = Manufacture.new
  #end

  # GET /manufactures/1/edit
  #def edit
  #end

  # POST /manufactures
  #def create
  #  @manufacture = Manufacture.new(manufacture_params)

  #  if @manufacture.save
  #    redirect_to @manufacture, notice: 'Manufacture was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /manufactures/1
  #def update
  #  if @manufacture.update(manufacture_params)
  #    redirect_to @manufacture, notice: 'Manufacture was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /manufactures/1
  #def destroy
  #  @manufacture.destroy
  #  redirect_to manufactures_url, notice: 'Manufacture was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacture
      @manufacture = Manufacture.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def manufacture_params
      params.require(:manufacture).permit(:result_no, :generate_no, :e_no, :facility_name, :facility_effect, :facility_lv, :facility_e_no, :item_name, :usage, :cost, :kind, :effect, :effect_lv, :potency, :precision, :total)
    end
end
