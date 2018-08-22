class PgwsController < ApplicationController
  include MyUtility
  before_action :set_pgw, only: [:show, :edit, :update, :destroy]

  # GET /pgws
  def index
    param_set
    @count	= Pgw.includes([:p_name]).search(params[:q]).result.count()
    @search	= Pgw.includes([:p_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @pgws	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    params["result_no_form"] = params["result_no_form"] ? params["result_no_form"] : sprintf('%d',@last_result)
    params[:q]  = params[:q] ? params[:q] : {}
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "pgws_type", "pgws_type_form")
    reference_number_assign(params, "pgws_name_id", "pgws_name_id_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @pgws_type_form = params["pgws_type_form"]
    @pgws_name_id_form = params["pgws_name_id_form"]
    
    @pgws_types = ["", "潜在1", "潜在2", "Good1", "Good2", "Weak1", "weak2", "専門1", "専門2"]
  end
  # GET /pgws/1
  #def show
  #end

  # GET /pgws/new
  #def new
  #  @pgw = Pgw.new
  #end

  # GET /pgws/1/edit
  #def edit
  #end

  # POST /pgws
  #def create
  #  @pgw = Pgw.new(pgw_params)

  #  if @pgw.save
  #    redirect_to @pgw, notice: 'Pgw was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /pgws/1
  #def update
  #  if @pgw.update(pgw_params)
  #    redirect_to @pgw, notice: 'Pgw was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /pgws/1
  #def destroy
  #  @pgw.destroy
  #  redirect_to pgws_url, notice: 'Pgw was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pgw
      @pgw = Pgw.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pgw_params
      params.require(:pgw).permit(:result_no, :generate_no, :e_no, :pgws_type, :pgws_name_id)
    end
end
