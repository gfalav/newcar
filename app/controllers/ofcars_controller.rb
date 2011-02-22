class OfcarsController < ApplicationController
  # GET /ofcars
  # GET /ofcars.xml
  def index
    @ofcars = Ofcar.all

    cadena = getofcars(@ofcars)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => cadena }
    end
  end

  def getofcars(ofcars)

    cadena = ''
    x = Builder::XmlMarkup.new(:target => cadena, :indent => 1)
    x.instruct!

    x.ofcars {
      ofcars.each {|o|
        x.ofcar(:id=>o.id,:oficina=>o.oficina)
      }
    }
    return cadena
  end

  # GET /ofcars/1
  # GET /ofcars/1.xml
  def show
    @ofcar = Ofcar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ofcar }
    end
  end

  # GET /ofcars/new
  # GET /ofcars/new.xml
  def new
    @ofcar = Ofcar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ofcar }
    end
  end

  # GET /ofcars/1/edit
  def edit
    @ofcar = Ofcar.find(params[:id])
  end

  # POST /ofcars
  # POST /ofcars.xml
  def create
    @ofcar = Ofcar.new(params[:ofcar])

    respond_to do |format|
      if @ofcar.save
        format.html { redirect_to(@ofcar, :notice => 'Ofcar was successfully created.') }
        format.xml  { render :xml => @ofcar, :status => :created, :location => @ofcar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ofcar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ofcars/1
  # PUT /ofcars/1.xml
  def update
    @ofcar = Ofcar.find(params[:id])

    respond_to do |format|
      if @ofcar.update_attributes(params[:ofcar])
        format.html { redirect_to(@ofcar, :notice => 'Ofcar was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ofcar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ofcars/1
  # DELETE /ofcars/1.xml
  def destroy
    @ofcar = Ofcar.find(params[:id])
    @ofcar.destroy

    respond_to do |format|
      format.html { redirect_to(ofcars_url) }
      format.xml  { head :ok }
    end
  end
end
