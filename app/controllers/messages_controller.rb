class MessagesController < ApplicationController
  before_action :find_message, only: %i[show edit update destroy]
  def index
    @messages = Message.all.order('created_at DESC')
  end

  def show; end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params.require(:message).permit(:title, :description))
    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    if message.update(mesage_params)
      redirect_to message_path
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path

  end

  private

  def message_params
    params.require(:message).permit(:title, :description)
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
