class FrontiersController < ApplicationController
  include MyUtility
  before_action :set_frontier, only: [:show, :edit, :update, :destroy]

  # GET /frontiers
  def index
    placeholder_set
    param_set
    @count	= Frontier.notnil().includes(:p_name).ransack(params[:q]).result.hit_count()
    @search	= Frontier.notnil().includes(:p_name).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @frontiers	= @search.result.per(50)
  end

  # GET /frontier/total
  def total
    placeholder_set
    param_set
    @count	= Frontier.notnil().includes(:p_name).groups(action_name, params).ransack(params[:q]).result.hit_count()
    @search	= Frontier.notnil().includes(:p_name).groups(action_name, params).for_group_select(action_name, params).having_order(params).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty? && params["ex_sort"] != "on"
    @frontiers	= @search.result.per(50)
  end

  def param_set
    @form_params = {}

    @latest_result = Name.maximum('result_no')

    params_clean(params)
    if !params["is_form"] && action_name == "total" then
        params["result_no_form"] ||= "1~" + sprintf('%d',@latest_result)
    end
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end

    if params["col_form"] then
        params["col_form"].upcase!
    end

    params_to_form(params, @form_params, column_name: "p_name_name", params_name: "p_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "col", params_name: "col_form", type: "text")
    params_to_form(params, @form_params, column_name: "lv", params_name: "lv_form", type: "number")

    toggle_params_to_variable(params, @form_params, params_name: "show_area")
    @base_first    = (!params["is_form"]) ? "1" : "0"
  end
  # GET /frontiers/1
  #def show
  #end

  # GET /frontiers/new
  #def new
  #  @frontier = Frontier.new
  #end

  # GET /frontiers/1/edit
  #def edit
  #end

  # POST /frontiers
  #def create
  #  @frontier = Frontier.new(frontier_params)

  #  if @frontier.save
  #    redirect_to @frontier, notice: 'Frontier was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /frontiers/1
  #def update
  #  if @frontier.update(frontier_params)
  #    redirect_to @frontier, notice: 'Frontier was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /frontiers/1
  #def destroy
  #  @frontier.destroy
  #  redirect_to frontiers_url, notice: 'Frontier was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frontier
      @frontier = Frontier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def frontier_params
      params.require(:frontier).permit(:result_no, :generate_no, :e_no, :col, :lv)
    end
end
