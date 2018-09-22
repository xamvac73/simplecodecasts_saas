class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user

  # form where user can fill out their own profile
  def new
    @user = User.find( params[:user_id] )
    @company = @user.build_company
  end

  # POST /companies
  # POST /companies.json
  def create
    @user = User.find( params[:user_id] )
    @company = @user.build_company(company_params)
      if @company.save
        flash[:success] = "Info Updated!"
        redirect_to user_path( params[:user_id] )
      else
        render action: :new
      end
  end

  # GET /companies/1/edit
  def edit
    @user = User.find( params[:user_id] )
    @company = @user.company
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
      @user = User.find( params[:user_id] )
      @company = @user.company
      if @company.update_attributes(company_params)
        flash[:success] = "Info Updated!"
        redirect_to user_path( params[:user_id] )
      else
        render action: :edit
      end
  end

  private
      def company_params
        params.require(:company).permit(:image, :first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
      end

      def only_current_user
        @user = User.find( params[:user_id] )
        redirect_to(root_url) unless @user == current_user
      end
end
