class BugsController < ApplicationController
  include MyUtility
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  # GET /bugs
  def index
    placeholder_set
    param_set
    @count	= Bug.notnil().where_front(params).includes(:p_name, :bug_name, :development_result, :pre_win, :bug_pre_win).ransack(params[:q]).result.count()
    @search	= Bug.notnil().where_front(params).includes(:p_name, :bug_name, :development_result, :pre_win, :bug_pre_win).page(params[:page]).ransack(params[:q])
    @search.sorts = 'bug_e_no asc' if @search.sorts.empty?
    @bugs	= @search.result.per(50)
  end

  # GET /effect_pre
  def effect_pre
    placeholder_set
    param_set
    group_set
    @count	= Bug.notnil().where("bugs.result_no = lv").includes(:p_name, :bug_name, :development_result, :pre_win, :bug_pre_win).ransack(params[:q]).result.count()
    @search	= Bug.notnil().where("bugs.result_no = bugs.lv").where("bugs.order = 0")
                 .joins(:development_result, :bug_pre_win).group(@group).group(:win)
                 .select("*").select("count(*) AS count").select("count(pre_wins.win = 0 or null) AS win_0,
                           count(pre_wins.win = 1 or null) AS win_1,
                           count(pre_wins.win = 2 or null) AS win_3,
                           count(pre_wins.win = 3 or null) AS win_2
                           ")
                 .ransack(params[:q])
    @search.sorts = 'bug_e_no asc' if @search.sorts.empty?
    @bugs	= @search.result
  end

  def group_set
    @group = "bugs.result_no, development_results.bellicose"

    if params["show_detail_party_num"] == "on" then
        @group = @group + "development.party_num"
    end
  end

  def param_set
    @latest_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_text_assign(params, "bug_name_name", "bug_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "bug_e_no", "bug_e_no_form")
    reference_number_assign(params, "lv", "lv_form")

    reference_number_assign(params, "development_result_bellicose", "bellicose_form")
    reference_number_assign(params, "development_result_party_num", "party_num_form")
    reference_number_assign(params, "bug_pre_win_win", "bug_win_form")
    reference_number_assign(params, "bug_pre_win_draw", "bug_draw_form")
    reference_number_assign(params, "bug_pre_win_lose", "bug_lose_form")
    reference_number_assign(params, "bug_pre_win_all", "bug_all_form")
 
    if params["only_bug_reader"] then
        params[:q]["order_eq"] = 0
    else
        params[:q]["order_eq"] = ""
    end

    if params["show_unknown"] then
        params[:q]["bug_e_no_not_eq"] = ""
    else
        params[:q]["bug_e_no_not_eq"] = 0
    end
   
    @p_name_form = params["p_name_form"]
    @bug_name_form = params["bug_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @bug_e_no_form = params["bug_e_no_form"]
    @lv_form = params["lv_form"]

    @bellicose_form = params["bellicose_form"]
    @party_num_form = params["party_num_form"]
    @bug_win_form = params["bug_win_form"]
    @bug_draw_form = params["bug_draw_form"]
    @bug_lose_form = params["bug_lose_form"]
    @bug_all_form = params["bug_all_form"]

    @only_bug_reader = params["only_bug_reader"]
    @only_front = params["only_front"]
    @show_unknown = params["show_unknown"]
    @show_detail_development = params["show_detail_development"]
    @show_detail_pre = params["show_detail_pre"]
  end
  # GET /bugs/1
  #def show
  #end

  # GET /bugs/new
  #def new
  #  @bug = Bug.new
  #end

  # GET /bugs/1/edit
  #def edit
  #end

  # POST /bugs
  #def create
  #  @bug = Bug.new(bug_params)

  #  if @bug.save
  #    redirect_to @bug, notice: 'Bug was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /bugs/1
  #def update
  #  if @bug.update(bug_params)
  #    redirect_to @bug, notice: 'Bug was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /bugs/1
  #def destroy
  #  @bug.destroy
  #  redirect_to bugs_url, notice: 'Bug was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bug_params
      params.require(:bug).permit(:result_no, :generate_no, :e_no, :bug_e_no, :lv)
    end
end
