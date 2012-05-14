class TicketsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    @statuses = Status.all
    @try_again=false
    if  !params[:lookup].nil?
      @lookup = params[:lookup]
      escaped_query = @lookup.gsub('%', '\%').gsub('_', '\_')
      @ticket_lookup = Ticket.find(:all, :conditions=> ["subject like :eq or reference like :eq", {:eq => "%" + escaped_query + "%"}])
      
      #@ticket_lookup = Ticket.find(:all, :conditions => ["reference like ?", "%"+@lookup + "%","subject like ?", "%"+@lookup + "%"])
      @tickets = @ticket_lookup
      if  @ticket_lookup.nil?
        @try_again=true
        @tickets = Ticket.all
      end
    end      
    @departments = Department.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @departments = Department.all
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new
    @departments = Department.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @departments = Department.all
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @departments = Department.all
    @ticket = Ticket.new(params[:ticket])
    str_zero="000000"
    if Ticket.last
      id=Ticket.last.id+1
    else
      id=0+1
    end  
    id=id.to_s
    id_size=id.size
    id_sized=5-(id_size-1)
    if id_size != 6 
        str_zero[id_sized..5]=id
    end    
    str_zero="ACD-"+str_zero
    @ticket.reference="#{str_zero}"
    @ticket.status_id=1
    @ticket.owner_id=1
    respond_to do |format|
      
      if @ticket.save
        new_requestbody="<div class='req'><span class='req_title'>Customer request:</span><br>"+params[:ticket][:requestbody]+"</div>"
        @ticket.update_attributes({:requestbody => new_requestbody})
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
        TicketMailer.ticket_delivered(@ticket).deliver
        flash[:success]="Please check your email."
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }   
      end
    end
    
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])
    @all_tickets=Ticket.all
    old_requestbody=@ticket.requestbody ? @ticket.requestbody : ""
    
    respond_to do |format|
      owner_id=params[:ticket][:owner_id]
      owner_name=Owner.find(owner_id).ownername
      new_requestbody=old_requestbody+"<br/><br/><span class='req_title'>"+owner_name+"  REPLY</span><br/>"+params[:ticket][:requestbody]
      #params[:requestbody]="dodo"
      #new_requestbody=params[:requestbody].value+old_requestbody
      #new_requestbody=" cvsfd"
      if @ticket.update_attributes(params[:ticket])
        @ticket.update_attributes({:requestbody => new_requestbody})
        format.html { redirect_to :controller => 'tickets', :action => 'index', notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end
    private

    def authenticate
      deny_access unless signed_in?
    end
end
