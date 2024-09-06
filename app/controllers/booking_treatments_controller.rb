class BookingTreatmentsController < ApplicationController
  before_action :set_booking_treatment, only: %i[ show edit update destroy ]

  # GET /booking_treatments or /booking_treatments.json
  def index
    @booking_treatments = BookingTreatment.all
  end

  # GET /booking_treatments/1 or /booking_treatments/1.json
  def show
  end

  # GET /booking_treatments/new
  def new
    @booking_treatment = BookingTreatment.new
  end

  # GET /booking_treatments/1/edit
  def edit
  end

  # POST /booking_treatments or /booking_treatments.json
  def create
    @booking_treatment = BookingTreatment.new(booking_treatment_params)

    respond_to do |format|
      if @booking_treatment.save
        format.html { redirect_to booking_treatment_url(@booking_treatment), notice: "Booking treatment was successfully created." }
        format.json { render :show, status: :created, location: @booking_treatment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_treatments/1 or /booking_treatments/1.json
  def update
    respond_to do |format|
      if @booking_treatment.update(booking_treatment_params)
        format.html { redirect_to booking_treatment_url(@booking_treatment), notice: "Booking treatment was successfully updated." }
        format.json { render :show, status: :ok, location: @booking_treatment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_treatments/1 or /booking_treatments/1.json
  def destroy
    @booking_treatment.destroy

    respond_to do |format|
      format.html { redirect_to booking_treatments_url, notice: "Booking treatment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_treatment
      @booking_treatment = BookingTreatment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_treatment_params
      params.require(:booking_treatment).permit(:booking_id, :treatment_id)
    end
end
