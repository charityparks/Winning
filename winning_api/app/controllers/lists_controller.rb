class ListsController < ApplicationController
  before_action :set_list, only: [:index, :show, :update, :destroy]

  # GET /lists
  def index
    @lists = List.all

    render json: ListSerializer.new(@lists).serialized_json

    # render json: @lists
  end

  # GET /lists/1
  def show
    @list = List.find_by(id: params[:id])
    render json: ListSerializer.new(@list).serialized_json
  end

  # POST /lists
  def create
   
    @list = List.new(list_params)

    if @list.save
      # render json: @list, status: :created, location: @list
      render json: ListSerializer.new(@list).serialized_json
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find_by(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_params
      params.require(:list).permit(:title, :description, :items,
          items_attributes: [:name])

    end
end
