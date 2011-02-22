require 'builder'

class VehiculosController < ApplicationController

  def addvehiculo
    debugger
    case params[:accion]
      when 'Agrega'
        vehiculo = Vehiculo.new
        vehiculo.patente = params[:patente]
        vehiculo.marca = params[:marca]
        vehiculo.modelo = params[:modelo]
        vehiculo.afabric = params[:afabric].to_i
        vehiculo.tvehiculo_id = params[:tvehiculo_id].to_i
        vehiculo.save
      when 'Edita'
        vehiculo = Vehiculo.find(params[:id].to_i)
        vehiculo.patente = params[:patente]
        vehiculo.marca = params[:marca]
        vehiculo.modelo = params[:modelo]
        vehiculo.afabric = params[:afabric].to_i
        vehiculo.tvehiculo_id = params[:tvehiculo_id].to_i
        vehiculo.save
      when 'Borra'
        vehiculo = Vehiculo.find(params[:id].to_i)
        vehiculo.destroy
    end
    @cadena = getvehiculos(Vehiculo.all)

    render :xml => @cadena
  end

  # GET /vehiculos
  # GET /vehiculos.xml
  def index
    @vehiculos = Vehiculo.all
    
    cadena = getvehiculos(@vehiculos)    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
    end
  end

  def getvehiculos(vehiculos)

    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    x.vehiculos {
      vehiculos.each {|v|
        x.vehiculo(:id=>v.id,:patente=>v.patente,:marca=>v.marca,:modelo=>v.modelo,:afabric=>v.afabric,:tvehiculo=>v.tvehiculo.tipo,:tvehiculo_id=>v.tvehiculo_id)
      }
    }
    return cadena
  end

  def getvehicdisp
    @vehiculos = Vehiculo.where(:movil_id=>0)

    cadena = getvehiculos(@vehiculos)    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
    end
  end
  
  # GET /vehiculos/1
  # GET /vehiculos/1.xml
  def show
    @vehiculo = Vehiculo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehiculo }
    end
  end

  # GET /vehiculos/new
  # GET /vehiculos/new.xml
  def new
    @vehiculo = Vehiculo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehiculo }
    end
  end

  # GET /vehiculos/1/edit
  def edit
    @vehiculo = Vehiculo.find(params[:id])
  end

  # POST /vehiculos
  # POST /vehiculos.xml
  def create
    @vehiculo = Vehiculo.new(params[:vehiculo])

    respond_to do |format|
      if @vehiculo.save
        format.html { redirect_to(@vehiculo, :notice => 'Vehiculo was successfully created.') }
        format.xml  { render :xml => @vehiculo, :status => :created, :location => @vehiculo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehiculos/1
  # PUT /vehiculos/1.xml
  def update
    @vehiculo = Vehiculo.find(params[:id])

    respond_to do |format|
      if @vehiculo.update_attributes(params[:vehiculo])
        format.html { redirect_to(@vehiculo, :notice => 'Vehiculo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vehiculos/1
  # DELETE /vehiculos/1.xml
  def destroy
    @vehiculo = Vehiculo.find(params[:id])
    @vehiculo.destroy

    respond_to do |format|
      format.html { redirect_to(vehiculos_url) }
      format.xml  { head :ok }
    end
  end
end
