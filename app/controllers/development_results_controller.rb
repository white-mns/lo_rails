class DevelopmentResultsController < ApplicationController
  include MyUtility
  before_action :set_development_result, only: [:show, :edit, :update, :destroy]

  # GET /development_results
  def index
    param_set
    @count	= DevelopmentResult.includes(:p_name).search(params[:q]).result.count()
    @search	= DevelopmentResult.includes(:p_name).page(params[:page]).search(params[:q])
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
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @development_result_form = params["development_result_form"]
    @bellicose_form = params["bellicose_form"]
    @party_num_form = params["party_num_form"]
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
