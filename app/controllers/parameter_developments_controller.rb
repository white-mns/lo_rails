class ParameterDevelopmentsController < ApplicationController
  include MyUtility
  before_action :set_parameter_development, only: [:show, :edit, :update, :destroy]

  # GET /parameter_developments
  def index
    param_set
    @count	= ParameterDevelopment.notnil().includes(:p_name, :cond_name).search(params[:q]).result.count()
    @search	= ParameterDevelopment.notnil().includes(:p_name, :cond_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @parameter_developments	= @search.result.per(50)
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
    reference_number_assign(params, "lv", "lv_form")
    reference_number_assign(params, "rank", "rank_form")
    reference_number_assign(params, "mlp", "mlp_form")
    reference_number_assign(params, "mfp", "mfp_form")
    reference_text_assign(params, "cond_name_name", "cond_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @lv_form = params["lv_form"]
    @rank_form = params["rank_form"]
    @mlp_form = params["mlp_form"]
    @mfp_form = params["mfp_form"]
    @cond_form = params["cond_form"]
  end
  # GET /parameter_developments/1
  #def show
  #end

  # GET /parameter_developments/new
  #def new
  #  @parameter_development = ParameterDevelopment.new
  #end

  # GET /parameter_developments/1/edit
  #def edit
  #end

  # POST /parameter_developments
  #def create
  #  @parameter_development = ParameterDevelopment.new(parameter_development_params)

  #  if @parameter_development.save
  #    redirect_to @parameter_development, notice: 'Parameter development was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /parameter_developments/1
  #def update
  #  if @parameter_development.update(parameter_development_params)
  #    redirect_to @parameter_development, notice: 'Parameter development was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /parameter_developments/1
  #def destroy
  #  @parameter_development.destroy
  #  redirect_to parameter_developments_url, notice: 'Parameter development was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter_development
      @parameter_development = ParameterDevelopment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parameter_development_params
      params.require(:parameter_development).permit(:result_no, :generate_no, :e_no, :lv, :rank, :mlp, :mfp, :cond)
    end
end
