class ParameterControlsController < ApplicationController
  include MyUtility
  before_action :set_parameter_control, only: [:show, :edit, :update, :destroy]

  # GET /parameter_controls
  def index
    param_set
    @count	= ParameterControl.notnil().includes(:p_name, :cond_name).search(params[:q]).result.count()
    @search	= ParameterControl.notnil().includes(:p_name, :cond_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @parameter_controls	= @search.result.per(50)
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
    reference_number_assign(params, "cond", "cond_form")
    reference_number_assign(params, "day", "day_form")
    reference_text_assign(params, "mod_name", "mod_form")
    reference_number_assign(params, "cvp", "cvp_form")
    reference_number_assign(params, "pvp", "pvp_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @cond_form = params["cond_form"]
    @day_form = params["day_form"]
    @mod_form = params["mod_form"]
    @cvp_form = params["cvp_form"]
    @pvp_form = params["pvp_form"]
  end
  # GET /parameter_controls/1
  #def show
  #end

  # GET /parameter_controls/new
  #def new
  #  @parameter_control = ParameterControl.new
  #end

  # GET /parameter_controls/1/edit
  #def edit
  #end

  # POST /parameter_controls
  #def create
  #  @parameter_control = ParameterControl.new(parameter_control_params)

  #  if @parameter_control.save
  #    redirect_to @parameter_control, notice: 'Parameter control was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /parameter_controls/1
  #def update
  #  if @parameter_control.update(parameter_control_params)
  #    redirect_to @parameter_control, notice: 'Parameter control was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /parameter_controls/1
  #def destroy
  #  @parameter_control.destroy
  #  redirect_to parameter_controls_url, notice: 'Parameter control was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter_control
      @parameter_control = ParameterControl.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parameter_control_params
      params.require(:parameter_control).permit(:result_no, :generate_no, :e_no, :cond, :day, :mod, :cvp, :pvp)
    end
end
