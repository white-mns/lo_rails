class ParameterProgressesController < ApplicationController
  include MyUtility
  before_action :set_parameter_progress, only: [:show, :edit, :update, :destroy]

  # GET /parameter_progresses
  def index
    param_set
    @count	= ParameterProgress.notnil().includes(:p_name).search(params[:q]).result.count()
    @search	= ParameterProgress.notnil().includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @parameter_progresses	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params[:q] = {}
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "tip", "tip_form")
    reference_number_assign(params, "tip_t", "tip_t_form")
    reference_number_assign(params, "build_t", "build_t_form")
    reference_number_assign(params, "mark_t", "mark_t_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @tip_form = params["tip_form"]
    @tip_t_form = params["tip_t_form"]
    @build_t_form = params["build_t_form"]
    @mark_t_form = params["mark_t_form"]
  end
  # GET /parameter_progresses/1
  #def show
  #end

  # GET /parameter_progresses/new
  #def new
  #  @parameter_progress = ParameterProgress.new
  #end

  # GET /parameter_progresses/1/edit
  #def edit
  #end

  # POST /parameter_progresses
  #def create
  #  @parameter_progress = ParameterProgress.new(parameter_progress_params)

  #  if @parameter_progress.save
  #    redirect_to @parameter_progress, notice: 'Parameter progress was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /parameter_progresses/1
  #def update
  #  if @parameter_progress.update(parameter_progress_params)
  #    redirect_to @parameter_progress, notice: 'Parameter progress was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /parameter_progresses/1
  #def destroy
  #  @parameter_progress.destroy
  #  redirect_to parameter_progresses_url, notice: 'Parameter progress was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter_progress
      @parameter_progress = ParameterProgress.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parameter_progress_params
      params.require(:parameter_progress).permit(:result_no, :generate_no, :e_no, :tip, :tip_t, :build_t, :mark_t)
    end
end
