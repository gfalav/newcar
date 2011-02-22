require 'builder'

class PersonalsController < ApplicationController

  def addpersonal
    debugger
    case params[:accion]
      when 'Agrega'
        personal = Personal.new
        personal.apellido = params[:apellido]
        personal.nombre = params[:nombre]
        personal.documento = params[:documento]
        personal.direccion = params[:direccion]
        personal.telefono = params[:telefono]
        personal.contratista_id = params[:contratista_id].to_i
        personal.save
      when 'Edita'
        personal = Personal.find(params[:id].to_i)
        personal.apellido = params[:apellido]
        personal.nombre = params[:nombre]
        personal.documento = params[:documento]
        personal.direccion = params[:direccion]
        personal.telefono = params[:telefono]
        personal.contratista_id = params[:contratista_id].to_i
        personal.save
      when 'Borra'
        personal = Personal.find(params[:id].to_i)
        personal.destroy
    end
    @cadena = getpersonals(Personal.all)

    render :xml => @cadena
  end

  # GET /personals
  # GET /personals.xml
  def index
    @personals = Personal.all

    cadena = getpersonals(@personals)


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
    end
  end

  def getpersonals(personals)

    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    x.personals {
      personals.each {|p|
        x.personal(:id=>p.id,:apellido=>p.apellido,:nombre=>p.nombre,:documento=>p.documento,:telefono=>p.telefono,:direccion=>p.direccion,:contratista=>p.contratista.nombre,:contratista_id=>p.contratista_id)
      }
    }
    return cadena
  end

  def getpersdisp
    @personals = Personal.where(:movil_id=>0)

    cadena = getpersonals(@personals)


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
    end
  end

  # GET /personals/1
  # GET /personals/1.xml
  def show
    @personal = Personal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @personal }
    end
  end

  # GET /personals/new
  # GET /personals/new.xml
  def new
    @personal = Personal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @personal }
    end
  end

  # GET /personals/1/edit
  def edit
    @personal = Personal.find(params[:id])
  end

  # POST /personals
  # POST /personals.xml
  def create
    @personal = Personal.new(params[:personal])

    respond_to do |format|
      if @personal.save
        format.html { redirect_to(@personal, :notice => 'Personal was successfully created.') }
        format.xml  { render :xml => @personal, :status => :created, :location => @personal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @personal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /personals/1
  # PUT /personals/1.xml
  def update
    @personal = Personal.find(params[:id])

    respond_to do |format|
      if @personal.update_attributes(params[:personal])
        format.html { redirect_to(@personal, :notice => 'Personal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @personal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /personals/1
  # DELETE /personals/1.xml
  def destroy
    @personal = Personal.find(params[:id])
    @personal.destroy

    respond_to do |format|
      format.html { redirect_to(personals_url) }
      format.xml  { head :ok }
    end
  end
end
