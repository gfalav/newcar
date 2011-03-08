require 'builder'
require "rexml/document"

class TurnosController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only=>[:saveallturnos,:saveturno]
  
  def saveturno
    if (params[:id].to_i==0)
      turno = Turno.new
    else
      turno = Turno.find(params[:id].to_i)
    end
    
    turno.fturno = params[:fturno]
    turno.tturno_id = Tturno.where(:turno=>params[:tturno].to_i).first.id
    turno.ofcar_id = params[:ofcar_id].to_i
    turno.movil_id = params[:movil_id].to_i
    turno.save
  
    cadena = 'ok'
    respond_to do |format|
      format.html { render :xml => cadena }
      format.xml  { render :xml => cadena }
    end
  end
  
  def saveallturnos
    fini = Date.new(params[:anio].to_i,params[:mes].to_i,1)
    ffin = fini.next_month-1

    doc = REXML::Document.new params[:jerarquia]
    doc.elements.each('turnos/ofcars/turno') {|e|
      Turno.where(:tturno_id=>1,:movil_id=>e.attributes['movil_id'].to_i,:fturno=>(fini..ffin)).destroy_all
      for n in fini.day..ffin.day
        if (e.attributes['f'+n.to_s].to_i !=0)
            if (e.attributes['t'+n.to_s].to_i!=0)
              turno = Turno.find(e.attributes['t'+n.to_s].to_i)
            else
              turno = Turno.new
            end
            turno.tturno_id = Tturno.where(:turno=>e.attributes['f'+n.to_s].to_i).first.id
            turno.fturno = fini + n - 1
            turno.movil_id = e.attributes['movil_id'].to_i
            turno.ofcar_id = e.attributes['ofcar_id'].to_i
            turno.save
        else
          turno = Turno.where(:id=>e.attributes['t'+n.to_s].to_i).first
          if (turno != nil)
            turno.destroy
          end
        end
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
          Turno.select('distinct movil_id').where(:ofcar_id=>o.id,:fturno=>(fini..ffin)).each {|tm|
            if (tm.movil.ofcar_id != o.id)
              moviles << tm.movil
            end
          }
          moviles.each {|m|
            a = Array.new
            b = Array.new
            (fini..ffin).each {|f|
              turno = Turno.where(:movil_id=>m.id,:fturno=>f,:ofcar_id=>o.id).first
              if (turno != nil)
                a << turno.tturno.turno
                b << turno.id
              else
                a << 0
                b << 0
              end
            }
            x.turno(:ofcar_id=>o.id,:movil_id=>m.id,:nombre=>m.nombre,:f1=>a[0],:f2=>a[1],:f3=>a[2],:f4=>a[3],:f5=>a[4],:f6=>a[5],:f7=>a[6],:f8=>a[7],:f9=>a[8],:f10=>a[9],:f11=>a[10],:f12=>a[11],:f13=>a[12],:f14=>a[13],:f15=>a[14],:f16=>a[15],:f17=>a[16],:f18=>a[17],:f19=>a[18],:f20=>a[19],:f21=>a[20],:f22=>a[21],:f23=>a[22],:f24=>a[23],:f25=>a[24],:f26=>a[25],:f27=>a[26],:f28=>a[27],:f29=>a[28],:f30=>a[29],:f31=>a[30],:t1=>b[0],:t2=>b[1],:t3=>b[2],:t4=>b[3],:t5=>b[4],:t6=>b[5],:t7=>b[6],:t8=>b[7],:t9=>b[8],:t10=>b[9],:t11=>b[10],:t12=>b[11],:t13=>b[12],:t14=>b[13],:t15=>b[14],:t16=>b[15],:t17=>b[16],:t18=>b[17],:t19=>b[18],:t20=>b[19],:t21=>b[20],:t22=>b[21],:t23=>b[22],:t24=>b[23],:t25=>b[24],:t26=>b[25],:t27=>b[26],:t28=>b[27],:t29=>b[28],:t30=>b[29],:t31=>b[30])
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
