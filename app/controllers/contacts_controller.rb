class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contacts.all
    render json: @contacts
  end

  # GET /contacts/:id
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    status = @contact.save ? :created : :unprocessable_entity
    render json: @contact, status: status
  end

  # PUT /contacts/:id
  def update
    status = @contact.update(contact_params) ? :ok : :unprocessable_entity
    render json: @contact, status: status
  end

  # DELETE /contacts/:id
  def destroy
    @contact.destroy
    head :ok
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :phone, :address)
    end
end
