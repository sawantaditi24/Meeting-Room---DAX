require 'rails_helper' 

feature "Bookings Associations Spec", :devise do 
  
  scenario "Users can create a new client through the New Booking Form" do 
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    today = Time.now.strftime("%m/%d/%Y")
    visit new_booking_path
    fill_in "booking_client_attributes_name", with: "my awesome new client"
    fill_in "booking_appointment_time_date", with: today
    select "2 PM", from: "booking_appointment_time_hour"
    select "00", from: "booking_appointment_time_min"
    select "1 hr", from: "booking_duration_hour"
    select "00 min", from: "booking_duration_min"
    fill_in "booking_price", with: 60
    click_button "Create Booking" 
    visit clients_path 
    expect(page).to have_content("my awesome new client")
  end
  
  let(:tomorrow_at_ten) { DateTime.now.midnight + 34.hours }
  
  scenario "users can create new locations from the booking form" do 
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    new_client = user.clients.create(name: 'my new client')
    new_booking = user.bookings.create(appointment_time: { "date" => tomorrow_at_ten.strftime("%Y-%m-%d"), "hour" => tomorrow_at_ten.strftime("%l"), "min" => tomorrow_at_ten.strftime("%M") }, duration: 3600, price: 80, client: new_client)
    visit edit_booking_path(new_booking)
    fill_in "booking_location_attributes_nickname", with: "my new awesome home"
    click_button "Update Booking"
    expect(page).to have_content("my new awesome home")
  end
    
end