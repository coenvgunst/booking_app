class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    # Create a new customer using the provided details
    @customer = Customer.new(name: booking_params[:customer_name], 
                             email: booking_params[:customer_email], 
                             phone_number: booking_params[:customer_phone_number])

    if @customer.save
      # Create the booking with the newly created customer
      @booking = Booking.new(booking_params.except(:customer_name, :customer_email, :customer_phone_number))
      @booking.customer = @customer

      if @booking.save
        redirect_to @booking, notice: 'Booking was successfully created.'
      else
        render :new, alert: 'Error creating booking.'
      end
    else
      render :new, alert: 'Error creating customer.'
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:customer_name, :customer_email, :customer_phone_number, :date, :time, :status, treatment_ids: [])
    end
end
