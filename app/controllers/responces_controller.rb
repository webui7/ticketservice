class ResponcesController < ApplicationController
  # GET /responces
  # GET /responces.json
  def index
    @responces = Responce.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responces }
    end
  end

  # GET /responces/1
  # GET /responces/1.json
  def show
    @responce = Responce.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @responce }
    end
  end

  # GET /responces/new
  # GET /responces/new.json
  def new
    @responce = Responce.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @responce }
    end
  end

  # GET /responces/1/edit
  def edit
    @responce = Responce.find(params[:id])
  end

  # POST /responces
  # POST /responces.json
  def create
    @responce = Responce.new(params[:responce])

    respond_to do |format|
      if @responce.save
        format.html { redirect_to @responce, notice: 'Responce was successfully created.' }
        format.json { render json: @responce, status: :created, location: @responce }
      else
        format.html { render action: "new" }
        format.json { render json: @responce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /responces/1
  # PUT /responces/1.json
  def update
    @responce = Responce.find(params[:id])

    respond_to do |format|
      if @responce.update_attributes(params[:responce])
        format.html { redirect_to @responce, notice: 'Responce was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @responce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responces/1
  # DELETE /responces/1.json
  def destroy
    @responce = Responce.find(params[:id])
    @responce.destroy

    respond_to do |format|
      format.html { redirect_to responces_url }
      format.json { head :no_content }
    end
  end
end
