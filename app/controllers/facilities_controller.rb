class FacilitiesController < ApplicationController
  include MyUtility
  before_action :set_facility, only: [:show, :edit, :update, :destroy]

  # GET /facilities
  def index
    param_set
    @count	= Facility.notnil().includes(:p_name, :holiday_name, :division_name, :detail_division_name).search(params[:q]).result.count()
    @search	= Facility.notnil().includes(:p_name, :holiday_name, :division_name, :detail_division_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @facilities	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_text_assign(params, "set_col", "set_col_form")
    reference_number_assign(params, "set_lv", "set_lv_form")
    reference_text_assign(params, "name", "name_form")
    reference_text_assign(params, "holiday_name_name", "holiday_form")
    reference_text_assign(params, "division_name_name", "division_form")
    reference_text_assign(params, "detail_division_name_name", "detail_division_form")
    reference_number_assign(params, "lv", "lv_form")
    reference_number_assign(params, "value", "value_form")
    reference_number_assign(params, "period", "period_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @set_col_form = params["set_col_form"]
    @set_lv_form = params["set_lv_form"]
    @name_form = params["name_form"]
    @holiday_form = params["holiday_form"]
    @division_form = params["division_form"]
    @detail_division_form = params["detail_division_form"]
    @lv_form = params["lv_form"]
    @value_form = params["value_form"]
    @period_form = params["period_form"]
  end
  # GET /facilities/1
  #def show
  #end

  # GET /facilities/new
  #def new
  #  @facility = Facility.new
  #end

  # GET /facilities/1/edit
  #def edit
  #end

  # POST /facilities
  #def create
  #  @facility = Facility.new(facility_params)

  #  if @facility.save
  #    redirect_to @facility, notice: 'Facility was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /facilities/1
  #def update
  #  if @facility.update(facility_params)
  #    redirect_to @facility, notice: 'Facility was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /facilities/1
  #def destroy
  #  @facility.destroy
  #  redirect_to facilities_url, notice: 'Facility was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def facility_params
      params.require(:facility).permit(:result_no, :generate_no, :e_no, :set_col, :set_lv, :name, :holiday, :division, :detail_division, :lv, :value, :period)
    end
end
