class BugsController < ApplicationController
  include MyUtility
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  # GET /bugs
  def index
    param_set
    @count	= Bug.notnil().includes(:p_name, :bug_name).search(params[:q]).result.count()
    @search	= Bug.notnil().includes(:p_name, :bug_name).page(params[:page]).search(params[:q])
    @search.sorts = 'bug_e_no asc' if @search.sorts.empty?
    @bugs	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params[:q] = {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_text_assign(params, "bug_name_name", "bug_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "bug_e_no", "bug_e_no_form")
    reference_number_assign(params, "lv", "lv_form")
 
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
    @show_unknown = params["show_unknown"]
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
