require 'builder'

class MovilsController < ApplicationController

  def addmovil
    debugger
    case params[:accion]
      when 'Agrega'
        movil = Movil.new
        movil.nombre = params[:nombre]
        movil.ofcar_id = params[:ofcar_id].to_i
        movil.save
        vehiculo = Vehiculo.find(params[:vehiculo_id].to_i)
        vehiculo.movil_id = movil.id
        vehiculo.save
        a = params[:personalsarr].split(',')
        a.each {|p|
          personal = Personal.find(p.to_i)
          personal.movil_id = movil.id
          personal.save
        }
      when 'Edita'
        movil = Movil.find(params[:id].to_i)
        movil.nombre = params[:nombre]
        movil.ofcar_id = params[:ofcar_id].to_i
        movil.save
        Vehiculo.where(:movil_id=>params[:id].to_i).each {|v|
          v.movil_id = 0
          v.save
        }
        vehiculo = Vehiculo.find(params[:vehiculo_id])
        vehiculo.movil_id = movil.id
        vehiculo.save
        Personal.where(:movil_id=>params[:id].to_i).each {|p|
          p.movil_id = 0
          p.save
        }
        a = params[:personalsarr].split(',')
        a.each {|p|
          personal = Personal.find(p.to_i)
          personal.movil_id = movil.id
          personal.save
        }
      when 'Borra'
        movil = Movil.find(params[:id].to_i)
        movil.destroy
    end
    @cadena = getmovils(Movil.all)

    render :xml => @cadena
  end

  # GET /movils
  # GET /movils.xml
  def index
    @movils = Movil.all
    
    cadena = getmovils(@movils)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
    end
  end

  def getmovils(movils)

    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    x.movils {
      movils.each {|m|
        x.movil(:id=>m.id,:nombre=>m.nombre,:ofcar_id=>m.ofcar_id,:ofcar=>m.ofcar.oficina){
          x.personals {
            m.personals.each {|p|
              x.personal(:id=>p.id,:apellido=>p.apellido,:nombre=>p.nombre,:documento=>p.documento,:telefono=>p.telefono,:direccion=>p.direccion,:contratista=>p.contratista.nombre,:contratista_id=>p.contratista_id)
            }
          }
          x.vehiculo(:id=>m.vehiculo.id,:patente=>m.vehiculo.patente,:marca=>m.vehiculo.marca,:modelo=>m.vehiculo.modelo,:afabric=>m.vehiculo.afabric,:tvehiculo=>m.vehiculo.tvehiculo.tipo,:tvehiculo_id=>m.vehiculo.tvehiculo_id)
        }
      }
    }
    return cadena
  end


  # GET /movils/1
  # GET /movils/1.xml
  def show
    @movil = Movil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movil }
    end
  end

  # GET /movils/new
  # GET /movils/new.xml
  def new
    @movil = Movil.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movil }
    end
  end

  # GET /movils/1/edit
  def edit
    @movil = Movil.find(params[:id])
  end

  # POST /movils
  # POST /movils.xml
  def create
    @movil = Movil.new(params[:movil])

    respond_to do |format|
      if @movil.save
        format.html { redirect_to(@movil, :notice => 'Movil was successfully created.') }
        format.xml  { render :xml => @movil, :status => :created, :location => @movil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movils/1
  # PUT /movils/1.xml
  def update
    @movil = Movil.find(params[:id])

    respond_to do |format|
      if @movil.update_attributes(params[:movil])
        format.html { redirect_to(@movil, :notice => 'Movil was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movils/1
  # DELETE /movils/1.xml
  def destroy
    @movil = Movil.find(params[:id])
    @movil.destroy

    respond_to do |format|
      format.html { redirect_to(movils_url) }
      format.xml  { head :ok }
    end
  end
end
