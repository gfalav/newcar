class TturnosController < ApplicationController
  # GET /tturnos
  # GET /tturnos.xml
  def index
    @tturnos = Tturno.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tturnos }
    end
  end

  # GET /tturnos/1
  # GET /tturnos/1.xml
  def show
    @tturno = Tturno.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tturno }
    end
  end

  # GET /tturnos/new
  # GET /tturnos/new.xml
  def new
    @tturno = Tturno.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tturno }
    end
  end

  # GET /tturnos/1/edit
  def edit
    @tturno = Tturno.find(params[:id])
  end

  # POST /tturnos
  # POST /tturnos.xml
  def create
    @tturno = Tturno.new(params[:tturno])

    respond_to do |format|
      if @tturno.save
        format.html { redirect_to(@tturno, :notice => 'Tturno was successfully created.') }
        format.xml  { render :xml => @tturno, :status => :created, :location => @tturno }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tturno.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tturnos/1
  # PUT /tturnos/1.xml
  def update
    @tturno = Tturno.find(params[:id])

    respond_to do |format|
      if @tturno.update_attributes(params[:tturno])
        format.html { redirect_to(@tturno, :notice => 'Tturno was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tturno.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tturnos/1
  # DELETE /tturnos/1.xml
  def destroy
    @tturno = Tturno.find(params[:id])
    @tturno.destroy

    respond_to do |format|
      format.html { redirect_to(tturnos_url) }
      format.xml  { head :ok }
    end
  end
end
