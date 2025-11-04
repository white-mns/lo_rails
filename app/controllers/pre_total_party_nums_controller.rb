class PreTotalPartyNumsController < ApplicationController
  include MyUtility
  before_action :set_pre_total_party_num, only: [:show, :edit, :update, :destroy]

  # GET /pre_total_party_nums
  def index
    placeholder_set
    param_set
    @count	= PreTotalPartyNum.notnil().includes(:p_name).ransack(params[:q]).result.count()
    @search	= PreTotalPartyNum.notnil().includes(:p_name).page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @pre_total_party_nums	= @search.result.per(50)
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
    reference_number_assign(params, "count_type", "count_type_form")
    reference_number_assign(params, "party_num", "party_num_form")

    params[:q]["count_type_eq_any"] = []
    if params["count_10"]  == "on" then params[:q]["count_type_eq_any"].push(10) end
    if params["count_11"]  == "on" then params[:q]["count_type_eq_any"].push(11) end
    if params["count_12"]  == "on" then params[:q]["count_type_eq_any"].push(12) end
    if params["count_13"]  == "on" then params[:q]["count_type_eq_any"].push(13) end
    if params["count_20"]  == "on" then params[:q]["count_type_eq_any"].push(20) end
    if params["count_21"]  == "on" then params[:q]["count_type_eq_any"].push(21) end
    if params["count_22"]  == "on" then params[:q]["count_type_eq_any"].push(22) end
    if params["count_23"]  == "on" then params[:q]["count_type_eq_any"].push(23) end
    if params["count_110"]  == "on" then params[:q]["count_type_eq_any"].push(110) end
    if params["count_111"]  == "on" then params[:q]["count_type_eq_any"].push(111) end
    if params["count_112"]  == "on" then params[:q]["count_type_eq_any"].push(112) end
    if params["count_113"]  == "on" then params[:q]["count_type_eq_any"].push(113) end
    if params["count_120"]  == "on" then params[:q]["count_type_eq_any"].push(120) end
    if params["count_121"]  == "on" then params[:q]["count_type_eq_any"].push(121) end
    if params["count_122"]  == "on" then params[:q]["count_type_eq_any"].push(122) end
    if params["count_123"]  == "on" then params[:q]["count_type_eq_any"].push(123) end
   
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @count_type_form = params["count_type_form"]
    @party_num_form = params["party_num_form"]

    @count_10 = params["count_10"]
    @count_11 = params["count_11"]
    @count_12 = params["count_12"]
    @count_13 = params["count_13"]
    @count_20 = params["count_20"]
    @count_21 = params["count_21"]
    @count_22 = params["count_22"]
    @count_23 = params["count_23"]
    @count_110 = params["count_110"]
    @count_111 = params["count_111"]
    @count_112 = params["count_112"]
    @count_113 = params["count_113"]
    @count_120 = params["count_120"]
    @count_121 = params["count_121"]
    @count_122 = params["count_122"]
    @count_123 = params["count_123"]
  end
  # GET /pre_total_party_nums/1
  #def show
  #end

  # GET /pre_total_party_nums/new
  #def new
  #  @pre_total_party_num = PreTotalPartyNum.new
  #end

  # GET /pre_total_party_nums/1/edit
  #def edit
  #end

  # POST /pre_total_party_nums
  #def create
  #  @pre_total_party_num = PreTotalPartyNum.new(pre_total_party_num_params)

  #  if @pre_total_party_num.save
  #    redirect_to @pre_total_party_num, notice: 'Pre total party num was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /pre_total_party_nums/1
  #def update
  #  if @pre_total_party_num.update(pre_total_party_num_params)
  #    redirect_to @pre_total_party_num, notice: 'Pre total party num was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /pre_total_party_nums/1
  #def destroy
  #  @pre_total_party_num.destroy
  #  redirect_to pre_total_party_nums_url, notice: 'Pre total party num was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_total_party_num
      @pre_total_party_num = PreTotalPartyNum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pre_total_party_num_params
      params.require(:pre_total_party_num).permit(:result_no, :generate_no, :e_no, :count_type, :party_num)
    end
end
