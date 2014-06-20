class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def index
		@contact = Contact.all
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		if @contact.update(contact_params)
			redirect_to @contact
		else
			render 'edit'
		end
	end

	def destroy
		@contact=Contact.find(params[:id])
		@contact.destroy
		respond_to do |format|
		format.html { redirect_to contacts_path, notice: 'Contact deletion Success' }
		end
	end

	def create
		#render plain: params[:contact].inspect
		puts contact_params
		@contact = Contact.new(contact_params)
		name=params[:contact][:photo].original_filename
		#@contact.raw_file = params[:contact][:avatar].read
debugger
		@contact.photo = name
		if @contact.save	
			# @contact.update(:photo => name)
			respond_to do |format|
			format.html { redirect_to @contact , notice: 'Done, Contact Added' }
			end

		else
			render 'new'
		end
	end
	def preview
		name=params[:contact][:photo].original_filename
    	directory = "public/data"
   		return path = File.join(directory, name)
	end
	private
		def contact_params
			File.open(preview, "wb") { |f| f.write(params[:contact][:photo].read) }
			params.require(:contact).permit(:firstname, :lastname, :mno, :emailid, :add)
		end
end
