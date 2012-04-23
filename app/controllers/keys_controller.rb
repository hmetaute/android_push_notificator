class KeysController < ApplicationController
  # GET /keys
  # GET /keys.json
  def index
    @keys = Key.where(:name => "coordinates")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @keys }
    end
  end

  # GET /keys/1
  # GET /keys/1.json
  def show
    @key = Key.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @key }
    end
  end

  # GET /keys/new
  # GET /keys/new.json
  def new
    @key = Key.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @key }
    end
  end

  # GET /keys/1/edit
  def edit
    @key = Key.find(params[:id])
  end

  # POST /keys
  # POST /keys.json
  def create
=begin
    #must change to production
    name = params[:name] #production
    #name = params[:key]["name"] #development
    if name.eql? "coordinates"
      @position = Key.find_by_name("coordinates")      
      if @position
        #must change as well to production
        @position.value = params[:value] #production
        #@position.value = params[:key]["value"] #development
        @position.save                  
        redirect_to @position, notice: 'coordinates were successfully updated.' 
        return
      end
    end
=end
    if(params[:key])
      @key = Key.new(params[:key])
    else      
      @key = Key.new
      @key.name = params[:name]
      @key.value = params[:value]
    end

    respond_to do |format|
      if @key.save
        format.html { redirect_to @key, notice: 'Key was successfully created.' }
        format.json { render json: @key, status: :created, location: @key }
      else
        format.html { render action: "new" }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /keys/1
  # PUT /keys/1.json
  def update
    @key = Key.find(params[:id])

    respond_to do |format|
      if @key.update_attributes(params[:key])
        format.html { redirect_to @key, notice: 'Key was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keys/1
  # DELETE /keys/1.json
  def destroy
    @key = Key.find(params[:id])
    @key.destroy

    respond_to do |format|
      format.html { redirect_to keys_url }
      format.json { head :ok }
    end
  end
end
