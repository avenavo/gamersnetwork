class ConversationsController < ApplicationController
  def create
    recipient = User.find(params[:id])
    if Conversation.where(sender_id: [current_user, recipient]).where(recipient_id: [current_user, recipient]).present?
      @conversation = Conversation.where(sender_id: [current_user, recipient]).where(recipient_id: [current_user, recipient]).first
    else
     
      if recipient != current_user
        @conversation = current_user.conversations.create(recipient_id: recipient.id)  
      else
        redirect_to posts_path, alert: "You can't talk to yourself"
      end
    end
    if @conversation
      redirect_to  conversation_messages_path(conversation_id: @conversation.id)
    end 
  end
end