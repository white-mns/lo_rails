class DevelopmentResultsController < ApplicationController
  include MyUtility
  before_action :set_development_result, only: [:show, :edit, :update, :destroy]

  # GET /development_results
  def index
    placeholder_set
    param_set
    @count	= DevelopmentResult.notnil().includes(:p_name, :place, :parameter_control).search(params[:q]).result.count()
    @search	= DevelopmentResult.notnil().includes(:p_name, :place, :parameter_control).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @development_results	= @search.result.per(50)
  end
  
  def win_per
    if !params["is_form"] then
        params["bellicose_form"] ||= "4~"
    end
    placeholder_set
    param_set
    win_per_set_group

    @count	= DevelopmentResult.notnil().includes(:p_name, :place, :parameter_control).search(params[:q]).result.count()
    @search	= DevelopmentResult.notnil().includes(:p_name).joins(:place, :parameter_control).group(@group)
                                .select("*").select("count(*) AS count").select("count(development_result = 1 or null) AS win,
                                    count(development_result = 0 or null) AS draw,
                                    count(development_result = -1 or null) AS lose,
                                    count(development_result = 1 or null) / count(*) AS win_per,
                                    min(places.result_no) AS min_result_no, max(places.result_no) AS max_result_no")
                                .search(params[:q])
    @search.sorts = @sort if @search.sorts.empty?
    @development_results	= @search.result
    
    @all = DevelopmentResult.notnil().includes(:p_name).joins(:place, :parameter_control)
                                .select("*").select("count(*) AS count").select("count(development_result = 1 or null) AS win,
                                    count(development_result = 0 or null) AS draw,
                                    count(development_result = -1 or null) AS lose,
                                    count(development_result = 1 or null) / count(*) AS win_per,
                                    min(places.result_no) AS min_result_no, max(places.result_no) AS max_result_no")
                                .search(params[:q]).result
  end

  def win_per_set_group
    @group = ""
    @sort  = []
    if params["split_invation_lv"] == "on" then
        @group = @group + "places.invation_lv"
        @sort.push('place_invation_lv desc')
    end
    if params["split_party_num"] == "on" then
        @group = @group == "" ? "party_num" : @group + ", party_num"
        @sort.push('party_num desc')
    end
    if params["split_bellicose"] == "on" then
        @group = @group == "" ? "bellicose" : @group + ", bellicose"
        @sort.push('bellicose desc')
    end
    if params["split_day"] == "on" then
        @group = @group == "" ? "parameter_controls.day" : @group + ", parameter_controls.day"
        @sort.push('parameter_control_day desc')
    end
  end

  def param_set
    @latest_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end
    
    if params["invation_col_form"] then
        params["invation_col_form"].upcase!
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
    if params["result_win"]  == "on" then params[:q]["development_result_eq_any"].push(1) end
    if params["result_draw"] == "on" then params[:q]["development_result_eq_any"].push(0) end
    if params["result_lose"] == "on" then params[:q]["development_result_eq_any"].push(-1) end
    
    if params["split_invation_lv"] != "on" && params["split_bellicose"] != "on" && params["split_party_num"] != "on" && params["split_day"] != "on" then
        params["split_invation_lv"] = "on"
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

    @split_invation_lv = params["split_invation_lv"]
    @split_bellicose = params["split_bellicose"]
    @split_party_num = params["split_party_num"]
    @split_day  = params["split_day"]
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
      params.require(:development_result).permit(:result_no, :generate_no, :e_no, :development_result, :bellicose, :party_num, :count, :win)
    end
end
