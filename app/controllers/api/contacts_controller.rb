class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.json.jb"
  end 

  def show 
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jb"
  end 

  def create
    coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.new(
      id: params[:id],
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      latitude: coordinates[0],
      longitude: coordinates[1]
    )

    @contact.save
    render "show.json.jb"
  end 

  def update 
    @contact = Contact.find_by(id: params[:id])

    if params[:address]
      coordinates = Geocoder.coordinates(params[:address])
      @contact.latitude = coordinates[0]
      @contact.longitude = coordinates[1]
    end 
    
    @contact.id = params[:id] || @contact.id
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio
    @contact.latitude = params[:latitude] || @contact.latitude
    @contact.longitude = params[:longitude] || @contact.longitude


    @contact.save
    render "show.json.jb"
  end 
  
  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy

    render json: {message: "The contact has been destroyed."}
  end 


end
