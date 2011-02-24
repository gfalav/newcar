require 'rexml/document'
require 'builder'

class TurnosController < ApplicationController

  def saveturnos
    debugger
    fini = Date.new(params[0][:anio].to_i,params[0][:mes].to_i,1)    
    ffin = fini.next_month-1

    cadena = getturnos(fini,ffin)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
      format.amf  { render :amf => cadena }
    end
  end

  # GET /turnos
  # GET /turnos.xml
  def index
    @turnos = Turno.all
    debugger
    fini = Date.new(params[0][:anio].to_i,params[0][:mes].to_i,1)
    ffin = fini.next_month-1

    cadena = getturnos(fini,ffin)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
      format.amf  { render :amf => cadena }
    end
  end

  def getturnos(fini,ffin)
    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!
    
    x.turnos(:nombre=>'Raiz') {
      Ofcar.all.each {|o|
        x.turno(:nombre=>o.oficina){
          moviles = Movil.where(:ofcar_id=>o.id)
          #acá agregar los móviles que no tiene la oficina por defecto
          moviles.each {|m|
            a = Array.new
            b = Array.new
            (fini..ffin).each {|f|
              h = Hash.new
              turno = Turno.where(:ofcar_id=>o.id,:movil_id=>m.id,:fturno=>f)[0]
              if (turno!=nil)
                a << turno.tturno.turno
                b << turno.ofcar_id
              else
                a << 0
                b << 0
              end
            }
            a << 0
            a << 0
            a << 0
            a << 0
            b << 0
            b << 0
            b << 0
            b << 0
            x.turno(:movil_id=>m.id,:nombre=>m.nombre,:ofcar_id=>o.id,:ofcar=>o.oficina,:f1=>a[1],:f2=>a[2],:f3=>a[3],:f4=>a[4],:f5=>a[5],:f6=>a[6],:f7=>a[7],:f8=>a[8],:f9=>a[9],:f10=>a[10],:f11=>a[11],:f12=>a[12],:f13=>a[13],:f14=>a[14],:f15=>a[15],:f16=>a[16],:f17=>a[17],:f18=>a[18],:f19=>a[19],:f20=>a[20],:f21=>a[21],:f22=>a[22],:f23=>a[23],:f24=>a[24],:f25=>a[25],:f26=>a[26],:f27=>a[27],:f28=>a[28],:f29=>a[29],:f30=>a[30],:f31=>a[31],:b1=>b[1],:b2=>b[2],:b3=>b[3],:b4=>b[4],:b5=>b[5],:b6=>b[6],:b7=>b[7],:b8=>b[8],:b9=>b[9],:b10=>b[10],:b11=>b[11],:b12=>b[12],:b13=>b[13],:b14=>b[14],:b15=>b[15],:b16=>b[16],:b17=>b[17],:b18=>b[18],:b19=>b[19],:b20=>b[20],:b21=>b[21],:b22=>b[22],:b23=>b[23],:b24=>b[24],:b25=>b[25],:b26=>b[26],:b27=>b[27],:b28=>b[28],:b29=>b[29],:b30=>b[30],:b31=>b[31])
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
