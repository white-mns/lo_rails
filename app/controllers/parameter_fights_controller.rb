class ParameterFightsController < ApplicationController
  include MyUtility
  before_action :set_parameter_fight, only: [:show, :edit, :update, :destroy]

  # GET /parameter_fights
  def index
    param_set
    @count	= ParameterFight.includes(:p_name).search(params[:q]).result.count()
    @search	= ParameterFight.includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @parameter_fights	= @search.result.per(50)
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
    reference_number_assign(params, "lv", "lv_form")
    reference_number_assign(params, "rank", "rank_form")
    reference_number_assign(params, "exp", "exp_form")
    reference_number_assign(params, "next", "next_form")
    reference_number_assign(params, "mlp", "mlp_form")
    reference_number_assign(params, "mfp", "mfp_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @lv_form = params["lv_form"]
    @rank_form = params["rank_form"]
    @exp_form = params["exp_form"]
    @next_form = params["next_form"]
    @mlp_form = params["mlp_form"]
    @mfp_form = params["mfp_form"]
  end
  # GET /parameter_fights/1
  #def show
  #end

  # GET /parameter_fights/new
  #def new
  #  @parameter_fight = ParameterFight.new
  #end

  # GET /parameter_fights/1/edit
  #def edit
  #end

  # POST /parameter_fights
  #def create
  #  @parameter_fight = ParameterFight.new(parameter_fight_params)

  #  if @parameter_fight.save
  #    redirect_to @parameter_fight, notice: 'Parameter fight was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /parameter_fights/1
  #def update
  #  if @parameter_fight.update(parameter_fight_params)
  #    redirect_to @parameter_fight, notice: 'Parameter fight was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /parameter_fights/1
  #def destroy
  #  @parameter_fight.destroy
  #  redirect_to parameter_fights_url, notice: 'Parameter fight was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter_fight
      @parameter_fight = ParameterFight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parameter_fight_params
      params.require(:parameter_fight).permit(:result_no, :generate_no, :e_no, :lv, :rank, :exp, :next, :mlp, :mfp)
    end
end
