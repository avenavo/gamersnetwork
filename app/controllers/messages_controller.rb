class MessagesController < ApplicationController

  def index
    @conversation = Conversation.find(params[:conversation_id])
    if Conversation.where("sender_id = ? OR recipient_id = ?", current_user.id,current_user.id).where(id: @conversation.id).present?
      @messages = @conversation.messages.order('created_at ASC')
      @reciever = interlocutor(@conversation)
    else
      redirect_to posts_path, alert: 'You are not authorized to access this page.'
    end
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @path = conversation_path(@conversation) 
    @reciever_path = user_path(interlocutor(@conversation))
    @author = current_user.username
    if Conversation.where("sender_id = ? OR recipient_id = ?", current_user.id,current_user.id).where(id: @conversation.id).present?
      @message = Message.create(:content => params[:message]['content'], :user_id => current_user.id, :conversation_id => @conversation.id)
      @message.conversation.touch :updated_at
    else
      redirect_to posts_path
    end
  end


  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end

  private

  def message_attributes
    params.require(:message).permit!
  end
end
