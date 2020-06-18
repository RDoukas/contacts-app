class ContactsController < ApplicationController

  def index 
    @contacts = Contact.all 
    render "index.html.erb"
  end 

  def new 
  end 

  def show
  end 

  def create 
  end 

  def edit

  end 

  def update 
  end 
  
  
  def destroy
  end 


end
