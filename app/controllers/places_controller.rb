class PlacesController < ApplicationController
  include MyUtility
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  def index
    param_set
    @count	= Place.notnil().includes(:p_name).search(params[:q]).result.count()
    @search	= Place.notnil().includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @places	= @search.result.per(50)
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
    reference_text_assign(params, "invation_col", "invation_col_form")
    reference_number_assign(params, "invation_lv", "invation_lv_form")
    reference_text_assign(params, "return_col", "return_col_form")
    reference_number_assign(params, "return_lv", "return_lv_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @invation_col_form = params["invation_col_form"]
    @invation_lv_form = params["invation_lv_form"]
    @return_col_form = params["return_col_form"]
    @return_lv_form = params["return_lv_form"]
  end
  # GET /places/1
  #def show
  #end

  # GET /places/new
  #def new
  #  @place = Place.new
  #end

  # GET /places/1/edit
  #def edit
  #end

  # POST /places
  #def create
  #  @place = Place.new(place_params)

  #  if @place.save
  #    redirect_to @place, notice: 'Place was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /places/1
  #def update
  #  if @place.update(place_params)
  #    redirect_to @place, notice: 'Place was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /places/1
  #def destroy
  #  @place.destroy
  #  redirect_to places_url, notice: 'Place was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def place_params
      params.require(:place).permit(:result_no, :generate_no, :e_no, :invation_col, :invation_lv, :return_col, :return_lv)
    end
end
