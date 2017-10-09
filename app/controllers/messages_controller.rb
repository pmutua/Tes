class MessagesController < ApplicationController
def index 
end

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

private 

def message_params
    params.require(:message).permit(:title, :description)
end

end
