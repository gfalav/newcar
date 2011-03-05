require 'builder'
require "rexml/document"

class TurnosController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only=>[:addturno]
  
  def addturno
    fini = Date.new(params[:anio].to_i,params[:mes].to_i,1)
    ffin = fini.next_month-1

    debugger
    doc = REXML::Document.new params[:jerarquia]
    doc.elements.each('turnos/ofcars/turno') {|e|
      puts e.attributes['nombre']
      for n in 1..ffin.day
        puts e.attributes['f'+n.to_s]
      end
    }

    cadena = getturnos(fini,ffin)

    respond_to do |format|
      format.html { render :xml => cadena }
      format.xml  { render :xml => cadena }
    end
  end

  # GET /turnos
  # GET /turnos.xml
  def index
    fini = Date.new(params[:anio].to_i,params[:mes].to_i,1)
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
    x.turnos(:nombre=>"Raiz"){
      Ofcar.all.each {|o|
        x.ofcars(:nombre=>o.oficina){
          moviles = Movil.where(:ofcar_id=>o.id)
          Turno.where(:ofcar_id=>o.id,:fturno=>(fini..ffin)).each {|tm|
            if (tm.movil.ofcar_id != o.id)
              moviles << tm.movil
            end
          }
          moviles.each {|m|
            a = Array.new
            (fini..ffin).each {|f|
              turno = Turno.where(:movil_id=>m.id,:fturno=>f,:ofcar_id=>o.id).first
              if (turno != nil)
                a << turno.tturno.id
              else
                a << 0
              end
            }
            x.turno(:movil_id=>m.id,:nombre=>m.nombre,:f1=>a[0],:f2=>a[1],:f3=>a[2],:f4=>a[3],:f5=>a[4],:f6=>a[5],:f7=>a[6],:f8=>a[7],:f9=>a[8],:f10=>a[9],:f11=>a[10],:f12=>a[11],:f13=>a[12],:f14=>a[13],:f15=>a[14],:f16=>a[15],:f17=>a[16],:f18=>a[17],:f19=>a[18],:f20=>a[19],:f21=>a[20],:f22=>a[21],:f23=>a[22],:f24=>a[23],:f25=>a[24],:f26=>a[25],:f27=>a[26],:f28=>a[27],:f29=>a[28],:f30=>a[29],:f31=>a[30])
          }
        }
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
