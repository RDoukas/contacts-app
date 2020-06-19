class ContactsController < ApplicationController

  def index 
    @contacts = Contact.all 
    render "index.html.erb"
  end 

  def new 
    render "new.html.org"
  end 

  def show
    @contact = Contact.find(params[:id])
    render "show.html.erb"
  end 

  def create 
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      groups: params[:groups],
      bio: params[:bio],
      latitude: params[:latitude],
      longitude: params[:longitude]
    )
    @contact.save
    redirect_to "/contacts/#{@contact.id}"
  end 

  def edit
    @contact = Contact.find(params[:id])
    render "edit.html.erb"
  end 

  def update 
    @contact = Contact.find(params[:id])
    @contact.first_name = params[:first_name]
    @contact.middle_name = params[:middle_name]
    @contact.last_name = params[:last_name]
    # @contact.email = params[:email]
    # @contact.groups = params[:groups]
    # @contact.bio = params[:bio]
    # @contact.latitude = params[:latitude]
    # @contact.longitude = params[:longitude]
    
    
    if @contact.save
    redirect_to "/contacts/#{@contact.id}"
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end 
  
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to "/contacts"
  end 


end
