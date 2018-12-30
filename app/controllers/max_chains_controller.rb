class MaxChainsController < ApplicationController
  include MyUtility
  before_action :set_max_chain, only: [:show, :edit, :update, :destroy]

  # GET /max_chains
  def index
    placeholder_set
    param_set
    @count	= MaxChain.notnil().search(params[:q]).result.count()
    @search	= MaxChain.notnil().page(params[:page]).search(params[:q])
    @search.sorts = 'max_chain desc' if @search.sorts.empty?
    @max_chains	= @search.result.per(50)
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
    reference_number_assign(params, "battle_page", "battle_page_form")
    reference_number_assign(params, "party", "party_form")
    reference_number_assign(params, "max_chain", "max_chain_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @battle_page_form = params["battle_page_form"]
    @party_form = params["party_form"]
    @max_chain_form = params["max_chain_form"]
  end
  # GET /max_chains/1
  #def show
  #end

  # GET /max_chains/new
  #def new
  #  @max_chain = MaxChain.new
  #end

  # GET /max_chains/1/edit
  #def edit
  #end

  # POST /max_chains
  #def create
  #  @max_chain = MaxChain.new(max_chain_params)

  #  if @max_chain.save
  #    redirect_to @max_chain, notice: 'Max chain was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /max_chains/1
  #def update
  #  if @max_chain.update(max_chain_params)
  #    redirect_to @max_chain, notice: 'Max chain was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /max_chains/1
  #def destroy
  #  @max_chain.destroy
  #  redirect_to max_chains_url, notice: 'Max chain was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_max_chain
      @max_chain = MaxChain.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def max_chain_params
      params.require(:max_chain).permit(:result_no, :generate_no, :battle_page, :party, :max_chain)
    end
end
