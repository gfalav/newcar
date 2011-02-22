require 'builder'

class CuentasController < ApplicationController

  def addcuenta
    case params[:accion]
      when 'Agrega'
        cuenta = Cuenta.new
        cuenta.nombre = params[:nombre]
        cuenta.ancestry = params[:ancestry]
        cuenta.save
      when 'Edita'
        cuenta = Cuenta.find(params[:id])
        cuenta.nombre = params[:nombre]
        cuenta.ancestry = params[:ancestry]
        cuenta.save
      when 'Borra'
        cuenta = Cuenta.find(params[:id])
        cuenta.destroy
    end
    
    @cadena = getcuentasxml    
    render :xml => @cadena

  end
  
  # GET /cuentas
  # GET /cuentas.xml
  def index
    @cuentas = Cuenta.all

    @cadena = getcuentasxml
        
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cadena }
    end
  end

  def getcuentasxml
    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    c = Cuenta.find(1)
    x.cuenta(:id=>1,:nombre=>c.nombre,:ancestry=>c.ancestry) do
      getcuentashijas(Cuenta.find(1),x)
    end

    return cadena  
  end

  def getcuentashijas(cuenta,x)
    cuenta.children.each {|c|
      x.cuenta(:id=>c.id,:nombre=>c.nombre,:ancestry=>c.ancestry) do
          getcuentashijas(c,x)
      end
    }
  end
  
  # GET /cuentas/1
  # GET /cuentas/1.xml
  def show
    @cuenta = Cuenta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cuenta }
    end
  end

  # GET /cuentas/new
  # GET /cuentas/new.xml
  def new
    @cuenta = Cuenta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cuenta }
    end
  end

  # GET /cuentas/1/edit
  def edit
    @cuenta = Cuenta.find(params[:id])
  end

  # POST /cuentas
  # POST /cuentas.xml
  def create
    @cuenta = Cuenta.new(params[:cuenta])

    respond_to do |format|
      if @cuenta.save
        format.html { redirect_to(@cuenta, :notice => 'Cuenta was successfully created.') }
        format.xml  { render :xml => @cuenta, :status => :created, :location => @cuenta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cuenta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cuentas/1
  # PUT /cuentas/1.xml
  def update
    @cuenta = Cuenta.find(params[:id])

    respond_to do |format|
      if @cuenta.update_attributes(params[:cuenta])
        format.html { redirect_to(@cuenta, :notice => 'Cuenta was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cuenta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cuentas/1
  # DELETE /cuentas/1.xml
  def destroy
    @cuenta = Cuenta.find(params[:id])
    @cuenta.destroy

    respond_to do |format|
      format.html { redirect_to(cuentas_url) }
      format.xml  { head :ok }
    end
  end
end
