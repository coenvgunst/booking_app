class TimeslotsController < ApplicationController
  # Fetch the timeslot before actions
  before_action :set_timeslot, only: %i[show edit update destroy]

  # GET /timeslots
  # Display all timeslots
  def index
    @timeslots = Timeslot.all
  end

  # GET /timeslots/:id
  # Display a specific timeslot
  def show
  end

  # GET /timeslots/new
  # Display form to create a new timeslot
  def new
    @timeslot = Timeslot.new
  end

  # GET /timeslots/:id/edit
  # Display form to edit an existing timeslot
  def edit
  end

  # POST /timeslots
  # Handle the creation of a new timeslot
  def create
    @timeslot = Timeslot.new(timeslot_params)

    if @timeslot.save
      redirect_to @timeslot, notice: 'Timeslot was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /timeslots/:id
  # Handle the update of an existing timeslot
  def update
    if @timeslot.update(timeslot_params)
      redirect_to @timeslot, notice: 'Timeslot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /timeslots/:id
  # Handle the deletion of a timeslot
  def destroy
    @timeslot.destroy
    redirect_to timeslots_url, notice: 'Timeslot was successfully destroyed.'
  end

  private

  # Set the timeslot for actions that need it
  def set_timeslot
    @timeslot = Timeslot.find(params[:id])
  end

  # Strong parameters: only allow the white-listed attributes
  def timeslot_params
    params.require(:timeslot).permit(:start_time, :end_time, :available)
  end
end
