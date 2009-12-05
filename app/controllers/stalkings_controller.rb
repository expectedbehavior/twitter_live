class StalkingsController < ApplicationController
  # GET /stalkings
  # GET /stalkings.xml
  def index
    @stalkings = Stalking.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stalkings }
    end
  end

  # GET /stalkings/1
  # GET /stalkings/1.xml
  def show
    @stalking = Stalking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stalking }
    end
  end

  # GET /stalkings/new
  # GET /stalkings/new.xml
  def new
    @stalking = Stalking.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stalking }
    end
  end

  # GET /stalkings/1/edit
  def edit
    @stalking = Stalking.find(params[:id])
  end

  # POST /stalkings
  # POST /stalkings.xml
  def create
    @stalking = Stalking.new(params[:stalking])

    respond_to do |format|
      if @stalking.save
        flash[:notice] = "You are now following #{@stalking.stalkee.login}"
        format.html { redirect_to([@stalking.stalkee, :tweets]) }
        format.xml  { render :xml => @stalking, :status => :created, :location => @stalking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stalking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stalkings/1
  # PUT /stalkings/1.xml
  def update
    @stalking = Stalking.find(params[:id])

    respond_to do |format|
      if @stalking.update_attributes(params[:stalking])
        flash[:notice] = 'Stalking was successfully updated.'
        format.html { redirect_to(@stalking) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stalking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stalkings/1
  # DELETE /stalkings/1.xml
  def destroy
    @stalking = Stalking.find(params[:id])
    @stalking.destroy

    respond_to do |format|
      format.html { redirect_to(stalkings_url) }
      format.xml  { head :ok }
    end
  end
end
