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


	def create
		#render plain: params[:contact].inspect
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to @contact
		else
			render 'new'
		end
	end
	def destroy
        @contact = Contact.find(params[:id])
        @contact.destroy
        redirect_to contacts_path
    end
	private
		def contact_params
			params.require(:contact).permit(:firstname, :lastname, :mno, :emailid, :add)
		end
end
