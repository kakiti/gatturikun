class ClientsController < ApplicationController
  before_action :move_to_login
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :update, :destroy]

  def index
    @clients = Client.order('created_at DESC')
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client.id)
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :tel_number, :prospect_id, :date,
                                   :memo).merge(user_id: current_user.id)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root
    redirect_to root_path if @client.user != current_user
  end
end
