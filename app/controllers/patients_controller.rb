class PatientsController < ApplicationController
	#layout 'admin'
	http_basic_authenticate_with name: "team2", password: "123456", only: :destroy
	

	def index
		@patients = Patient.all
	end

	def new
		@patient = Patient.new({:name => "Patient Name",:address => "Patient Address", :age => "Patient Age"})
	end

	def show
  		@patient = Patient.find(params[:id])
	end

	def create
		#Instantiate a new object using form parameters
	    #@ward = Ward.new(params[:ward])
	    #@ward = Ward.new(params.require(:ward).permit(:name))
	    @patient = Patient.new(patient_params)
	    #save the object
	    if @patient.save
	      #If save succeeds, redirect to the index action.
	      flash[:notice] = "Patient registered successfully..."
	      redirect_to(:action => 'index')
	    else
	      #If save fails, redisplay the form so user can fix problems
	      render('new')
	    end
	end

	def edit
		@patient = Patient.find(params[:id]) 
	end
	

	def update
  		#Find an existing object using form parameters
	    #@patient = Patient.new(params[:patient])
	    #@patient = Patient.new(params.require(:patient).permit(:name))
	    @patient = Patient.find(params[:id])
	    #update the object
	    if @patient.update_attributes(patient_params)
	      #If update succeeds, redirect to the index action.
	      flash[:notice] = "patient record updated successfully..."
	      redirect_to(:action => 'show', :id => @patient.id)
	    else
	      #If update fails, redisplay the form so user can fix problems
	      render('edit')
	    end
	end

	def delete
		@patient = Patient.find(params[:id])
		
	end

	def destroy
		@patient = Patient.find(params[:id]).destroy
		flash[:notice] = "patient record destroyed successfully..."
		#@patient.destroy

		redirect_to(:action => 'index')
		
	end
	

	private
    def patient_params
    	#same as using "params[:ward]", except that it:
    	#-raises an error if :ward is not present
    	#-allows listed attributes to be mass-assigned
	    params.require(:patient).permit(:name, :address, :age, :diagnosis, :status)
	end
end
