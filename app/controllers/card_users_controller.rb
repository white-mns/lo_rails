class CardUsersController < ApplicationController
  include MyUtility
  before_action :set_card_user, only: [:show, :edit, :update, :destroy]

  # GET /card_users
  def index
    param_set
    @count	= CardUser.notnil().includes(:p_name).detail_group_count(params)
    @search	= CardUser.notnil().includes(:p_name).detail_group(params).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @card_users	= @search.result.per(50)
  end

  # GET /card_users
  def sum
    index
  end

  # GET /card_users
  def history
    index
    @card_users	= @search.result
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
    reference_text_assign(params, "battle_page", "battle_page_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "party", "party_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_number_assign(params, "success", "success_form")
    reference_number_assign(params, "control", "control_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    
    params[:q]["success_eq_any"] ||= []
    if params["is_success"]  == "on" then params[:q]["success_eq_any"].push(1) end
    if params["not_success"] == "on" then params[:q]["success_eq_any"].push(-1) end

    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @battle_page_form = params["battle_page_form"]
    @e_no_form = params["e_no_form"]
    @party_form = params["party_form"]
    @card_id_form = params["card_id_form"]
    @success_form = params["success_form"]
    @control_form = params["control_form"]
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    
    @is_success  = params["is_success"]
    @not_success = params["not_success"]
    if params[:q]["success_eq_any"].size == 0 then 
        @is_success  = "on"
        @not_success = "on"
    end

    @pre_detail_open = params["pre_detail_open"]
  end
  # Get /card_users/1
  #def show
  #end

  # GET /card_users/new
  #def new
  #  @card_user = CardUser.new
  #end

  # GET /card_users/1/edit
  #def edit
  #end

  # POST /card_users
  #def create
  #  @card_user = CardUser.new(card_user_params)

  #  if @card_user.save
  #    redirect_to @card_user, notice: 'Card user was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /card_users/1
  #def update
  #  if @card_user.update(card_user_params)
  #    redirect_to @card_user, notice: 'Card user was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /card_users/1
  #def destroy
  #  @card_user.destroy
  #  redirect_to card_users_url, notice: 'Card user was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_user
      @card_user = CardUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_user_params
      params.require(:card_user).permit(:result_no, :generate_no, :battle_page, :e_no, :party, :card_id, :success, :control)
    end
end
