class ItemUsesController < ApplicationController
  include MyUtility
  before_action :set_item_use, only: [:show, :edit, :update, :destroy]

  # GET /item_uses
  def index
    placeholder_set
    param_set
    @count	= ItemUse.notnil().includes(:p_name).search(params[:q]).result.count()
    @search	= ItemUse.notnil().includes(:p_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @item_uses	= @search.result.per(50)
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
    reference_number_assign(params, "i_no", "i_no_form")
    reference_text_assign(params, "name", "name_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @i_no_form = params["i_no_form"]
    @name_form = params["name_form"]
  end
  # GET /item_uses/1
  #def show
  #end

  # GET /item_uses/new
  #def new
  #  @item_use = ItemUse.new
  #end

  # GET /item_uses/1/edit
  #def edit
  #end

  # POST /item_uses
  #def create
  #  @item_use = ItemUse.new(item_use_params)

  #  if @item_use.save
  #    redirect_to @item_use, notice: 'Item use was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /item_uses/1
  #def update
  #  if @item_use.update(item_use_params)
  #    redirect_to @item_use, notice: 'Item use was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /item_uses/1
  #def destroy
  #  @item_use.destroy
  #  redirect_to item_uses_url, notice: 'Item use was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_use
      @item_use = ItemUse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_use_params
      params.require(:item_use).permit(:result_no, :generate_no, :e_no, :i_no, :name)
    end
end
