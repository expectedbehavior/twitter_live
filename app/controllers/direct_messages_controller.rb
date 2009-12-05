class DirectMessagesController < ApplicationController
  # GET /direct_messages
  # GET /direct_messages.xml
  def index
    @direct_messages = current_user.received_messages
    @direct_message = current_user.sent_messages.build

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @direct_messages }
    end
  end

  # GET /direct_messages/1
  # GET /direct_messages/1.xml
  def show
    @direct_message = DirectMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @direct_message }
    end
  end

  # GET /direct_messages/new
  # GET /direct_messages/new.xml
  def new
    @direct_message = current_user.sent_messages.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @direct_message }
    end
  end

  # GET /direct_messages/1/edit
  def edit
    @direct_message = DirectMessage.find(params[:id])
  end

  # POST /direct_messages
  # POST /direct_messages.xml
  def create
    @direct_message = current_user.sent_messages.build(params[:direct_message])

    respond_to do |format|
      if @direct_message.save
        flash[:notice] = 'Direct message sent'
        format.html { redirect_to(direct_messages_path) }
        format.xml  { render :xml => @direct_message, :status => :created, :location => @direct_message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @direct_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /direct_messages/1
  # PUT /direct_messages/1.xml
  def update
    @direct_message = DirectMessage.find(params[:id])

    respond_to do |format|
      if @direct_message.update_attributes(params[:direct_message])
        flash[:notice] = 'DirectMessage was successfully updated.'
        format.html { redirect_to(@direct_message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @direct_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /direct_messages/1
  # DELETE /direct_messages/1.xml
  def destroy
    @direct_message = DirectMessage.find(params[:id])
    @direct_message.destroy

    respond_to do |format|
      format.html { redirect_to(direct_messages_url) }
      format.xml  { head :ok }
    end
  end
end
