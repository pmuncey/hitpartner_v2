class MessagesController < ApplicationController
  def index
    @q = Message.ransack(params[:q])
    @messages = @q.result(:distinct => true).includes(:user, :match).page(params[:page]).per(10)

    # @message.body = params[:body]
    # @message.match_id = params[:match_id]
    # @message.user_id = params[:user_id] #author

    render("messages/index.html.erb")
  end

  def show
    @message = Message.find(params[:id])

    @message.body = params[:body]
    @message.match_id = params[:match_id]
    @message.user_id = params[:user_id] #author

    render("messages/show.html.erb")
  end

  def new
    @message = Message.new

    render("messages/new.html.erb")
  end

  def create
    @message = Message.new

    @message.body = params[:body]
    @message.match_id = params[:match_id]
    @message.user_id = params[:user_id] #author


    save_status = @message.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/messages/new", "/create_message"
        redirect_to("/messages")
      else
        redirect_back(:fallback_location => "/", :notice => "Message created successfully.")
      end
    else
      render("messages/new.html.erb")
    end
  end

  def edit
    @message = Message.find(params[:id])

    render("messages/edit.html.erb")
  end

  def update
    @message = Message.find(params[:id])

    @message.body = params[:body]
    @message.match_id = params[:match_id]
    @message.user_id = params[:user_id]

    save_status = @message.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/messages/#{@message.id}/edit", "/update_message"
        redirect_to("/messages/#{@message.id}", :notice => "Message updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Message updated successfully.")
      end
    else
      render("messages/edit.html.erb")
    end
  end

  def destroy
    @message = Message.find(params[:id])

    @message.destroy

    if URI(request.referer).path == "/messages/#{@message.id}"
      redirect_to("/", :notice => "Message deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Message deleted.")
    end
  end
end
