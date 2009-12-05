class TweetsController < ApplicationController
  
  before_filter :find_user
  
  # GET /tweets
  # GET /tweets.xml
  def index
    redirect_to [current_user, :tweets] and return if logged_in? and !@user
    @tweets = @user.andand.timeline || Tweet.all
    @tweet = Tweet.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tweets }
    end
  end
  
  def search
    @tweets = Tweet.search(params[:search_tweets])
    @tweet = Tweet.new
    render :action => "index"
  end

  # GET /tweets/1
  # GET /tweets/1.xml
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.xml
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.xml
  def create
    @tweet = current_user.tweets.build(params[:tweet])

    respond_to do |format|
      if @tweet.save
        flash[:notice] = 'Tweet was successfully created.'
        format.html { redirect_to(tweets_path) }
        format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.xml
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        flash[:notice] = 'Tweet was successfully updated.'
        format.html { redirect_to(@tweet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.xml
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to(tweets_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end
  
end
