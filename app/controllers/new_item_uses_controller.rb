class NewItemUsesController < ApplicationController
  include MyUtility
  before_action :set_new_item_use, only: [:show, :edit, :update, :destroy]

  # GET /new_item_uses
  def index
    placeholder_set
    param_set
    @count	= NewItemUse.notnil().ransack(params[:q]).result.count()
    @search	= NewItemUse.notnil().page(params[:page]).ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @new_item_uses	= @search.result.per(50)
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
    reference_text_assign(params, "name", "name_form")
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @name_form = params["name_form"]
  end
  # GET /new_item_uses/1
  #def show
  #end

  # GET /new_item_uses/new
  #def new
  #  @new_item_use = NewItemUse.new
  #end

  # GET /new_item_uses/1/edit
  #def edit
  #end

  # POST /new_item_uses
  #def create
  #  @new_item_use = NewItemUse.new(new_item_use_params)

  #  if @new_item_use.save
  #    redirect_to @new_item_use, notice: 'New item use was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /new_item_uses/1
  #def update
  #  if @new_item_use.update(new_item_use_params)
  #    redirect_to @new_item_use, notice: 'New item use was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /new_item_uses/1
  #def destroy
  #  @new_item_use.destroy
  #  redirect_to new_item_uses_url, notice: 'New item use was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_item_use
      @new_item_use = NewItemUse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_item_use_params
      params.require(:new_item_use).permit(:result_no, :generate_no, :name)
    end
end
