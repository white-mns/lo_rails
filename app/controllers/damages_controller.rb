class DamagesController < ApplicationController
  include MyUtility
  before_action :set_damage, only: [:show, :edit, :update, :destroy]

  # GET /damages
  def index
    param_set
    @count	= Damage.notnil().includes(:p_name).search(params[:q]).result.count()
    @search	= Damage.notnil().includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @damages	= @search.result.per(50)
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
    reference_number_assign(params, "battle_page", "battle_page_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "party", "party_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_number_assign(params, "chain", "chain_form")
    reference_number_assign(params, "target_e_no", "target_e_no_form")
    reference_number_assign(params, "target_party", "target_party_form")
    reference_number_assign(params, "act_type", "act_type_form")
    reference_number_assign(params, "element", "element_form")
    reference_number_assign(params, "damage", "damage_form")
    reference_number_assign(params, "is_weak", "is_weak_form")
    reference_number_assign(params, "is_critical", "is_critical_form")
    reference_number_assign(params, "is_clean", "is_clean_form")
    reference_number_assign(params, "is_vanish", "is_vanish_form")
    reference_number_assign(params, "is_absorb", "is_absorb_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @battle_page_form = params["battle_page_form"]
    @e_no_form = params["e_no_form"]
    @party_form = params["party_form"]
    @card_id_form = params["card_id_form"]
    @chain_form = params["chain_form"]
    @target_e_no_form = params["target_e_no_form"]
    @target_party_form = params["target_party_form"]
    @act_type_form = params["act_type_form"]
    @element_form = params["element_form"]
    @damage_form = params["damage_form"]
    @is_weak_form = params["is_weak_form"]
    @is_critical_form = params["is_critical_form"]
    @is_clean_form = params["is_clean_form"]
    @is_vanish_form = params["is_vanish_form"]
    @is_absorb_form = params["is_absorb_form"]
  end
  # GET /damages/1
  #def show
  #end

  # GET /damages/new
  #def new
  #  @damage = Damage.new
  #end

  # GET /damages/1/edit
  #def edit
  #end

  # POST /damages
  #def create
  #  @damage = Damage.new(damage_params)

  #  if @damage.save
  #    redirect_to @damage, notice: 'Damage was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /damages/1
  #def update
  #  if @damage.update(damage_params)
  #    redirect_to @damage, notice: 'Damage was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /damages/1
  #def destroy
  #  @damage.destroy
  #  redirect_to damages_url, notice: 'Damage was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_damage
      @damage = Damage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def damage_params
      params.require(:damage).permit(:result_no, :generate_no, :battle_page, :e_no, :party, :card_id, :chain, :target_e_no, :target_party, :act_type, :element, :damage, :is_weak, :is_critical, :is_clean, :is_vanish, :is_absorb)
    end
end
