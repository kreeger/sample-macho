class PushupRemindersController < ApplicationController
  before_filter :get_user
  before_filter :get_pushup_reminders, only: [:index]
  before_filter :get_pushup_reminder, except: [:new, :create, :index]

  # GET /pushup_reminders
  # GET /pushup_reminders.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pushup_reminders }
    end
  end

  # GET /pushup_reminders/1
  # GET /pushup_reminders/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pushup_reminder }
    end
  end

  # GET /pushup_reminders/new
  # GET /pushup_reminders/new.json
  def new
    @pushup_reminder = @user.presence ? @user.pushup_reminders.build : PushupReminder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pushup_reminder }
    end
  end

  # GET /pushup_reminders/1/edit
  def edit
  end

  # POST /pushup_reminders
  # POST /pushup_reminders.json
  def create
    if @user.presence
      @pushup_reminder = @user.pushup_reminders.create(params[:pushup_reminder])
    else
      @pushup_reminder = PushupReminder.create(params[:pushup_reminder])
    end

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
    @pushup_reminder.destroy

    respond_to do |format|
      format.html { redirect_to pushup_reminders_url }
      format.json { head :no_content }
    end
  end

  protected

  def get_user
    @user = params[:user_id] ? User.find(params[:user_id]) : nil
  end

  def get_pushup_reminders
    @pushup_reminders = @user.presence ? @user.pushup_reminders : PushupReminder.all
  end

  def get_pushup_reminder
    @pushup_reminder = @user.presence ? @user.pushup_reminders.find(params[:id]) : PushupReminder.find(params[:id])
  end
end
