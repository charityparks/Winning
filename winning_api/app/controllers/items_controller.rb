class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    # @items = Item.all
    @items = Item.where(list_id: params[:list_id])
    render json: ItemSerializer.new(@items).serialized_json, status: :ok
    # render json: @items, include: [:list]
  end

  # GET /items/1
  def show
  
    @item = find_by(id: params[:id])
    render json: ItemSerializer.new(@item).serialized_json, status: :ok

    # render json: @item
  end

  # POST /items
  def create
    if params[:list_id]
      @list = List.find_by(list_id: params[:list_id])
      @item = @list.items.build(item_params)
            if @item.save
                render json: ItemSerializer.new(@item).serialized_json, status: :ok
            else
                error_resp = {
                    error: @item.errors.full_messages.to_sentence
                }
                render json: error_resp, status: :unprocessable_entity
            end
      end
    end

    # @item = Item.new(item_params)

    # if @item.save
    #   render json: @item, status: :created, location: @item
    # else
    #   render json: @item.errors, status: :unprocessable_entity
    # end
  

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name, :list_id)
    end
end
