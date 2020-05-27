class Api::ContactsController < ApplicationController

  def print_contacts_action
    @contact = Contact.first
    render "print_contacts.json.jb"
  end 

  def all_contacts_action
    @contacts = Contact.all
    render 'all_contacts.json.jb'
  end 
end
