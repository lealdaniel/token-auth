class ItemController < ApplicationController
  def index
    items = Item.where(user_id: @current_user.id)
    render json: { items: items }
  end

  def show
  
  
  end


  def create
    item = Item.create(user_id: @current_user.id, description: "")
    render json: { item: item }
  end

  def update
    item = Item.find(params[:id])
    if item.user_id == @current_user.id
      if item.update(item_params) 
        render json: { item: item }
      else
      render json: { failure: "Try again!" }

      end
    else
      render json: { failure: "You don't have permission" }
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == @current_user.id
      item.delete
      render json: { success: 'OK'}
    else
      render json: { failure: "You don't have permission" }
    end
  end


  private

  def item_params
    params.permit(:description)
  end

end
