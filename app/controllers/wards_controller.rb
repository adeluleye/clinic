class WardsController < ApplicationController
  layout 'admin'
  before_action :confirm_logged_in

  def index
    @wards = Ward.all
    #@wards = Ward.order("wards.position")
  end

  def new
    @ward = Ward.new#({:name => "Enter Patient Ward"})
  end

  def show
    @ward = Ward.find(params[:id])
  end

  def create
    #Instantiate a new object using form parameters
    #@ward = Ward.new(params[:ward])
    #@ward = Ward.new(params.require(:ward).permit(:name))
    @ward = Ward.new(ward_params)
    #save the object
    if @ward.save
      #If save succeeds, redirect to the index action.
      flash[:notice] = "clinic ward created successfully..."
      redirect_to(:action => 'index')
    else
      #If save fails, redisplay the form so user can fix problems
      render('new')
    end
   
  end

  def edit
    @ward = Ward.find(params[:id])
  end

  def update
    #Find an existing object using form parameters
    #@ward = Ward.new(params[:ward])
    #@ward = Ward.new(params.require(:ward).permit(:name))
    @ward = Ward.find(params[:id])
    #update the object
    if @ward.update_attributes(ward_params)
      #If update succeeds, redirect to the index action.
      flash[:notice] = "clinic ward updated successfully..."
      redirect_to(:action => 'show', :id => @ward.id)
    else
      #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  
  end

  def delete
    @ward = Ward.find(params[:id])
  end

  def destroy
    ward = Ward.find(params[:id]).destroy
    flash[:notice] = "clinic ward '#{ward.name}' destroyed successfully..."
    #ward.destroy
    redirect_to(:action => 'index')
  end

  private

  def ward_params
    #same as using "params[:ward]", except that it:
    #-raises an error if :ward is not present
    #-allows listed attributes to be mass-assigned
    params.require(:ward).permit(:name)
  end
end
