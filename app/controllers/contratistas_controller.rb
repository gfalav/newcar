class ContratistasController < ApplicationController
  # GET /contratistas
  # GET /contratistas.xml
  def index
    @contratistas = Contratista.all
    
    cadena = getcontratistas(@contratistas)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
    end
  end

  def getcontratistas(contratistas)

    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    x.contratistas {
      contratistas.each {|c|
        x.contratista(:id=>c.id,:nombre=>c.nombre)
      }
    }
    return cadena
  end

  # GET /contratistas/1
  # GET /contratistas/1.xml
  def show
    @contratista = Contratista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contratista }
    end
  end

  # GET /contratistas/new
  # GET /contratistas/new.xml
  def new
    @contratista = Contratista.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contratista }
    end
  end

  # GET /contratistas/1/edit
  def edit
    @contratista = Contratista.find(params[:id])
  end

  # POST /contratistas
  # POST /contratistas.xml
  def create
    @contratista = Contratista.new(params[:contratista])

    respond_to do |format|
      if @contratista.save
        format.html { redirect_to(@contratista, :notice => 'Contratista was successfully created.') }
        format.xml  { render :xml => @contratista, :status => :created, :location => @contratista }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contratista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contratistas/1
  # PUT /contratistas/1.xml
  def update
    @contratista = Contratista.find(params[:id])

    respond_to do |format|
      if @contratista.update_attributes(params[:contratista])
        format.html { redirect_to(@contratista, :notice => 'Contratista was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contratista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contratistas/1
  # DELETE /contratistas/1.xml
  def destroy
    @contratista = Contratista.find(params[:id])
    @contratista.destroy

    respond_to do |format|
      format.html { redirect_to(contratistas_url) }
      format.xml  { head :ok }
    end
  end
end
