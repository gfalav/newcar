require 'builder'

class ActividadsController < ApplicationController

  def addactividad
    debugger
    case params[:accion]
      when 'Agrega'
        fechas = params[0][:fechas].split(',')
        if (params[0][:metfecha]!='rf')
          fechas.each {|a|
            actividad = Actividad.new
            actividad.cuenta_id = params[0][:cuenta_id]
            actividad.descripcion = params[0][:descripcion]
            actividad.factividad = a
            actividad.hscar = params[0][:hscar]
            actividad.save
          }
        else
          fechas[0]..fechas[1].each {|a|
            actividad = Actividad.new
            actividad.cuenta_id = params[0][:cuenta_id]
            actividad.descripcion = params[0][:descripcion]
            actividad.factividad = a
            actividad.hscar = params[0][:hscar]
            actividad.save
          }
        end
      when 'Edita'
        actividad = Actividad.find(params[0][:id])
        actividad.cuenta_id = params[0][:cuenta_id]
        actividad.descripcion = params[0][:descripcion]
        actividad.factividad = params[0][:fechas]
        actividad.hscar = params[0][:hscar]
        actividad.save
      when 'Borra'
        actividad = Actividad.find(params[0][:id])
        actividad.destroy
    end
    @cadena = getactividades(params[0][:cuenta_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
      format.amf  { render :amf => cadena }
    end

  end
  
  # GET /actividads
  # GET /actividads.xml
  def index
    cadena = getactividades(params[0][:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
      format.amf  { render :amf => cadena }
    end
  end

  def getactividades(cuenta_id)
    indexs = Array.new
    activarr = Array.new

    indexs = Cuenta.find(params[0][:id]).descendant_ids << params[0][:id]

    @actividads = Actividad.where(:cuenta_id=>indexs)

    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    x.actividads {
      @actividads.each {|a|
        x.actividad(:id=>a.id,:cuenta_id=>a.cuenta_id,:nombre=>a.cuenta.nombre,:descripcion=>a.descripcion,:factividad=>a.factividad,:hscar=>a.hscar)
      }
    }
    
    return cadena
  end

  def indexcuentasactividadmes
  
    cadena = getcuentasactivmesxml(params)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
      format.amf  { render :amf => cadena }
    end
  end

  def getcuentasactivmesxml(params)
    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    c = Cuenta.find(1)
    a = Date.new(params[0][:anio],1,1)
    b = a.next_year-1
    m = Actividad.group('extract(month from factividad)').where(:cuenta_id=>c.descendant_ids << c.id,:factividad=>(a..b)).sum(:hscar)
    x.cuenta(:id=>c.id,:nombre=>c.nombre,:ancestry=>c.ancestry,:m1=>m['1'],:m2=>m['2'],:m3=>m['3'],:m4=>m['4'],:m5=>m['5'],:m6=>m['6'],:m7=>m['7'],:m8=>m['8'],:m9=>m['9'],:m10=>m['10'],:m11=>m['11'],:m12=>m['12'],:hscar=>Actividad.where(:cuenta_id=>c.descendant_ids << c.id).sum(:hscar)) do
      gethijosmes(c,x)
    end

     return cadena  
  end

  def gethijosmes(cuenta,x)
    cuenta.children.each {|c|
    a = Date.new(params[0][:anio],1,1)
    b = a.next_year-1
    m = Actividad.group('extract(month from factividad)').where(:cuenta_id=>c.descendant_ids << c.id,:factividad=>(a..b)).sum(:hscar)
      x.cuenta(:id=>c.id,:nombre=>c.nombre,:ancestry=>c.ancestry,:m1=>m['1'],:m2=>m['2'],:m3=>m['3'],:m4=>m['4'],:m5=>m['5'],:m6=>m['6'],:m7=>m['7'],:m8=>m['8'],:m9=>m['9'],:m10=>m['10'],:m11=>m['11'],:m12=>m['12'],:hscar=>Actividad.where(:cuenta_id=>c.descendant_ids << c.id).sum(:hscar)) do
          gethijosmes(c,x)
      end
    }
  end

  def indexcuentasactividaddia
    cadena = getcuentasactivdiaxml(params)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
      format.amf  { render :amf => cadena }
    end
  end

  def getcuentasactivdiaxml(params)
    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    c = Cuenta.find(1)
    
    a = Date.new(params[0][:anio],params[0][:mes],1)
    b = a.next_month-1    
    m = Actividad.group('extract(day from factividad)').where(:cuenta_id=>c.descendant_ids << c.id,:factividad=>(a..b)).sum(:hscar)
    x.cuenta(:id=>c.id,:nombre=>c.nombre,:ancestry=>c.ancestry,:m1=>m['1'],:m2=>m['2'],:m3=>m['3'],:m4=>m['4'],:m5=>m['5'],:m6=>m['6'],:m7=>m['7'],:m8=>m['8'],:m9=>m['9'],:m10=>m['10'],:m11=>m['11'],:m12=>m['12'],:m13=>m['13'],:m14=>m['14'],:m15=>m['15'],:m16=>m['16'],:m17=>m['17'],:m18=>m['18'],:m19=>m['19'],:m20=>m['20'],:m21=>m['21'],:m22=>m['22'],:m23=>m['23'],:m24=>m['24'],:m25=>m['25'],:m26=>m['26'],:m27=>m['27'],:m28=>m['28'],:m29=>m['29'],:m30=>m['30'],:m31=>m['31'],:hscar=>Actividad.where(:cuenta_id=>c.descendant_ids << c.id).sum(:hscar)) do
      gethijosdia(c,x)
    end

     return cadena  
  end

  def gethijosdia(cuenta,x)
    cuenta.children.each {|c|
    a = Date.new(params[0][:anio],params[0][:mes],1)
    b = a.next_month-1    
    m = Actividad.group('extract(day from factividad)').where(:cuenta_id=>c.descendant_ids << c.id,:factividad=>(a..b)).sum(:hscar)
    x.cuenta(:id=>c.id,:nombre=>c.nombre,:ancestry=>c.ancestry,:m1=>m['1'],:m2=>m['2'],:m3=>m['3'],:m4=>m['4'],:m5=>m['5'],:m6=>m['6'],:m7=>m['7'],:m8=>m['8'],:m9=>m['9'],:m10=>m['10'],:m11=>m['11'],:m12=>m['12'],:m13=>m['13'],:m14=>m['14'],:m15=>m['15'],:m16=>m['16'],:m17=>m['17'],:m18=>m['18'],:m19=>m['19'],:m20=>m['20'],:m21=>m['21'],:m22=>m['22'],:m23=>m['23'],:m24=>m['24'],:m25=>m['25'],:m26=>m['26'],:m27=>m['27'],:m28=>m['28'],:m29=>m['29'],:m30=>m['30'],:m31=>m['31'],:hscar=>Actividad.where(:cuenta_id=>c.descendant_ids << c.id).sum(:hscar)) do
          gethijosdia(c,x)
      end
    }
  end

  # GET /actividads/1
  # GET /actividads/1.xml
  def show
    @actividad = Actividad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @actividad }
    end
  end

  # GET /actividads/new
  # GET /actividads/new.xml
  def new
    @actividad = Actividad.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @actividad }
    end
  end

  # GET /actividads/1/edit
  def edit
    @actividad = Actividad.find(params[:id])
  end

  # POST /actividads
  # POST /actividads.xml
  def create
    @actividad = Actividad.new(params[:actividad])

    respond_to do |format|
      if @actividad.save
        format.html { redirect_to(@actividad, :notice => 'Actividad was successfully created.') }
        format.xml  { render :xml => @actividad, :status => :created, :location => @actividad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @actividad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /actividads/1
  # PUT /actividads/1.xml
  def update
    @actividad = Actividad.find(params[:id])

    respond_to do |format|
      if @actividad.update_attributes(params[:actividad])
        format.html { redirect_to(@actividad, :notice => 'Actividad was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @actividad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /actividads/1
  # DELETE /actividads/1.xml
  def destroy
    @actividad = Actividad.find(params[:id])
    @actividad.destroy

    respond_to do |format|
      format.html { redirect_to(actividads_url) }
      format.xml  { head :ok }
    end
  end
end
