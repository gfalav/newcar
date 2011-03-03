require 'builder'

class TurnosController < ApplicationController

  def saveturnos
  end

  # GET /turnos
  # GET /turnos.xml
  def index
    @turnos = Turno.all
    fini = Date.new(2011,2,1)
    # fini = Date.new(params[0][:anio].to_i,params[0][:mes].to_i,1)
    ffin = fini.next_month-1

    cadena = getturnos(fini,ffin)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
    end
  end

  def getturnos(fini,ffin)
    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!
    x.turnos{
      (fini..ffin).each {|f|
        
      }
    }  
    return cadena
  end
  
  
  # GET /turnos/1
  # GET /turnos/1.xml
  def show
    @turno = Turno.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @turno }
    end
  end

  # GET /turnos/new
  # GET /turnos/new.xml
  def new
    @turno = Turno.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @turno }
    end
  end

  # GET /turnos/1/edit
  def edit
    @turno = Turno.find(params[:id])
  end

  # POST /turnos
  # POST /turnos.xml
  def create
    @turno = Turno.new(params[:turno])

    respond_to do |format|
      if @turno.save
        format.html { redirect_to(@turno, :notice => 'Turno was successfully created.') }
        format.xml  { render :xml => @turno, :status => :created, :location => @turno }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @turno.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /turnos/1
  # PUT /turnos/1.xml
  def update
    @turno = Turno.find(params[:id])

    respond_to do |format|
      if @turno.update_attributes(params[:turno])
        format.html { redirect_to(@turno, :notice => 'Turno was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @turno.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /turnos/1
  # DELETE /turnos/1.xml
  def destroy
    @turno = Turno.find(params[:id])
    @turno.destroy

    respond_to do |format|
      format.html { redirect_to(turnos_url) }
      format.xml  { head :ok }
    end
  end
end
