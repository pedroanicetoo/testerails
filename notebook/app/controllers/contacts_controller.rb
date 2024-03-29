class ContactsController < ApplicationController
   before_filter :set_contact, :only => [:show, :edit, :update, :destroy]
   before_filter :set_options_for_selected, :only => [:new,:edit,:create,:update]
   http_basic_authenticate_with name: "pedro", password: "123456", only: :destroy
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.paginate(page: params[:page], per_page: 10)
    @meu_nome = "pedro lixo"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new
    @contact.build_address ##importante rodar as tasks novamente se os contatos não estiverem com endereços 'criados'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: I18n.t('messages.created') }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to contacts_path, notice: I18n.t('messages.updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_path, notice: I18n.t('messages.destroyed') }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  private
    def set_options_for_selected
      @kind_options_for_select = Kind.all
    end
end
