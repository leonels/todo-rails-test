class ListsController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  before_filter only: :show do
    @list = List.find(params[:id])
  end

  # GET /lists
  def index
    @lists = List.all

    respond_to do |format|
      format.html
      format.json { render :json => @lists }
    end
  end

  # GET /lists/1
  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.order(sort_column + ' ' + sort_direction)

    respond_to do |format|
      format.html
      format.json { render :json => @list }
    end
  end

  # GET /lists/new
  def new
    @list = List.new

    respond_to do |format|
      format.html
      format.json { render :json => @list }
    end
  end

  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @list }
    end
  end

  # POST /lists
  def create
    @list = List.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :no_content }
    end
  end

  private
    
  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
    
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end