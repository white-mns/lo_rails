class FacilityDivisionDataController < ApplicationController
  include MyUtility
  before_action :set_facility_division_datum, only: [:show, :edit, :update, :destroy]

  # GET /facility_division_data
  def index
    placeholder_set
    param_set
    @count	= FacilityDivisionDatum.includes(:detail_name, :major_name).ransack(params[:q]).result.count()
    @search	= FacilityDivisionDatum.includes(:detail_name, :major_name).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @facility_division_data	= @search.result.per(50)
  end

  def param_set
    @latest_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "division_id", "division_id_form")
    reference_text_assign(params, "detail_name_name", "detail_form")
    reference_text_assign(params, "major_name_name", "major_form")
    
    @p_name_form = params["p_name_form"]
    @division_id_form = params["division_id_form"]
    @detail_form = params["detail_form"]
    @major_form = params["major_form"]
  end
  # GET /facility_division_data/1
  #def show
  #end

  # GET /facility_division_data/new
  #def new
  #  @facility_division_datum = FacilityDivisionDatum.new
  #end

  # GET /facility_division_data/1/edit
  #def edit
  #end

  # POST /facility_division_data
  #def create
  #  @facility_division_datum = FacilityDivisionDatum.new(facility_division_datum_params)

  #  if @facility_division_datum.save
  #    redirect_to @facility_division_datum, notice: 'Facility division datum was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /facility_division_data/1
  #def update
  #  if @facility_division_datum.update(facility_division_datum_params)
  #    redirect_to @facility_division_datum, notice: 'Facility division datum was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /facility_division_data/1
  #def destroy
  #  @facility_division_datum.destroy
  #  redirect_to facility_division_data_url, notice: 'Facility division datum was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility_division_datum
      @facility_division_datum = FacilityDivisionDatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def facility_division_datum_params
      params.require(:facility_division_datum).permit(:division_id, :detail, :major)
    end
end
