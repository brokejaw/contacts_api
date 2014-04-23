class ContactsController < ApplicationController
  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])

    contact.destroy

    render json: "GONE"
  end

  def index
    # user = User.find(params[:user_id])
    # contacts = user.contacts + user.shared_contact
    #
    # render json: contacts

    contacts = Contact.find_by_sql([<<-SQL, params[:user_id], params[:user_id]])
      SELECT contacts.*
      FROM contacts
      LEFT OUTER JOIN contact_shares
      ON contacts.id = contact_shares.contact_id
      WHERE contact_shares.user_id = ?
      OR contacts.user_id = ?
    SQL

    render json: contacts
  end

  def show
    contact = Contact.find(params[:id])

    render json: contact
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update_attributes(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end

