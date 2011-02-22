class TvehiculosController < ApplicationController
  # GET /tvehiculos
  # GET /tvehiculos.xml
  def index
    @tvehiculos = Tvehiculo.all

    cadena = gettvehiculos(@tvehiculos)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
    end
  end

  def gettvehiculos(tvehiculos)

    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    x.tvehiculos {
      tvehiculos.each {|t|
        x.tvehiculo(:id=>t.id,:tipo=>t.tipo)
      }
    }
    return cadena
  end

  # GET /tvehiculos/1
  # GET /tvehiculos/1.xml
  def show
    @tvehiculo = Tvehiculo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tvehiculo }
    end
  end

  # GET /tvehiculos/new
  # GET /tvehiculos/new.xml
  def new
    @tvehiculo = Tvehiculo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tvehiculo }
    end
  end

  # GET /tvehiculos/1/edit
  def edit
    @tvehiculo = Tvehiculo.find(params[:id])
  end

  # POST /tvehiculos
  # POST /tvehiculos.xml
  def create
    @tvehiculo = Tvehiculo.new(params[:tvehiculo])

    respond_to do |format|
      if @tvehiculo.save
        format.html { redirect_to(@tvehiculo, :notice => 'Tvehiculo was successfully created.') }
        format.xml  { render :xml => @tvehiculo, :status => :created, :location => @tvehiculo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tvehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tvehiculos/1
  # PUT /tvehiculos/1.xml
  def update
    @tvehiculo = Tvehiculo.find(params[:id])

    respond_to do |format|
      if @tvehiculo.update_attributes(params[:tvehiculo])
        format.html { redirect_to(@tvehiculo, :notice => 'Tvehiculo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tvehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tvehiculos/1
  # DELETE /tvehiculos/1.xml
  def destroy
    @tvehiculo = Tvehiculo.find(params[:id])
    @tvehiculo.destroy

    respond_to do |format|
      format.html { redirect_to(tvehiculos_url) }
      format.xml  { head :ok }
    end
  end
end
