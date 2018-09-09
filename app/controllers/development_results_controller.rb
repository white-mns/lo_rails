class DevelopmentResultsController < ApplicationController
  include MyUtility
  before_action :set_development_result, only: [:show, :edit, :update, :destroy]

  # GET /development_results
  def index
    param_set
    @count	= DevelopmentResult.includes(:p_name, :place, :parameter_control).search(params[:q]).result.count()
    @search	= DevelopmentResult.includes(:p_name, :place, :parameter_control).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @development_results	= @search.result.per(50)
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
    reference_number_assign(params, "development_result", "development_result_form")
    reference_number_assign(params, "bellicose", "bellicose_form")
    reference_number_assign(params, "party_num", "party_num_form")
    reference_text_assign(params, "place_invation_col", "invation_col_form")
    reference_number_assign(params, "place_invation_lv", "invation_lv_form")
    reference_number_assign(params, "parameter_control_day", "day_form")
    
    params[:q]["development_result_eq_any"] ||= []
    if params["result_win"]  == "on" then params[:q]["development_result_eq_any"].push(1)  end
    if params["result_draw"] == "on" then params[:q]["development_result_eq_any"].push(0)  end
    if params["result_lose"] == "on" then params[:q]["development_result_eq_any"].push(-1) end
    if !params["result_win"]  && !params["result_draw"] && !params["result_lose"] then
        params["result_win"]  = "on"
        params["result_draw"] = "on"
        params["result_lose"] = "on"
    end

    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @development_result_form = params["development_result_form"]
    @bellicose_form = params["bellicose_form"]
    @party_num_form = params["party_num_form"]
    @result_win = params["result_win"]
    @result_draw = params["result_draw"]
    @result_lose = params["result_lose"]
    @invation_col_form = params["invation_col_form"]
    @invation_lv_form = params["invation_lv_form"]
    @day_form = params["day_form"]
  end
  # GET /development_results/1
  #def show
  #end

  # GET /development_results/new
  #def new
  #  @development_result = DevelopmentResult.new
  #end

  # GET /development_results/1/edit
  #def edit
  #end

  # POST /development_results
  #def create
  #  @development_result = DevelopmentResult.new(development_result_params)

  #  if @development_result.save
  #    redirect_to @development_result, notice: 'Development result was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /development_results/1
  #def update
  #  if @development_result.update(development_result_params)
  #    redirect_to @development_result, notice: 'Development result was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /development_results/1
  #def destroy
  #  @development_result.destroy
  #  redirect_to development_results_url, notice: 'Development result was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_development_result
      @development_result = DevelopmentResult.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def development_result_params
      params.require(:development_result).permit(:result_no, :generate_no, :e_no, :development_result, :bellicose, :party_num)
    end
end
