class PushupRemindersController < ApplicationController
  before_filter :get_user
  # GET /pushup_reminders
  # GET /pushup_reminders.json
  def index
    @pushup_reminders = @user.pushup_reminders

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pushup_reminders }
    end
  end

  # GET /pushup_reminders/1
  # GET /pushup_reminders/1.json
  def show
    @pushup_reminder = @user.pushup_reminders.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pushup_reminder }
    end
  end

  # GET /pushup_reminders/new
  # GET /pushup_reminders/new.json
  def new
    @pushup_reminder = @user.pushup_reminders.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pushup_reminder }
    end
  end

  # GET /pushup_reminders/1/edit
  def edit
    @pushup_reminder = @user.pushup_reminders.find(params[:id])
  end

  # POST /pushup_reminders
  # POST /pushup_reminders.json
  def create
    @pushup_reminder = @user.pushup_reminders.create(params[:pushup_reminder])

    respond_to do |format|
      if @pushup_reminder.save
        format.html { redirect_to [@user, @pushup_reminder], notice: 'Pushup reminder was successfully created.' }
        format.json { render json: @pushup_reminder, status: :created, location: @pushup_reminder }
      else
        format.html { render action: "new" }
        format.json { render json: @pushup_reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pushup_reminders/1
  # PUT /pushup_reminders/1.json
  def update
    @pushup_reminder = @user.pushup_reminders.find(params[:id])

    respond_to do |format|
      if @pushup_reminder.update_attributes(params[:pushup_reminder])
        format.html { redirect_to [@user, @pushup_reminder], notice: 'Pushup reminder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pushup_reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pushup_reminders/1
  # DELETE /pushup_reminders/1.json
  def destroy
    @pushup_reminder = @user.pushup_reminders.find(params[:id])
    @pushup_reminder.destroy

    respond_to do |format|
      format.html { redirect_to pushup_reminders_url }
      format.json { head :no_content }
    end
  end

  protected

  def get_user
    @user = User.find(params[:user_id])
  end
end
