class HomeController < ApplicationController
  def index
    @bookings = Booking.all
  end
end
