const start_date_1i = document.getElementById("booking_start_date_1i");
const start_date_2i = document.getElementById("booking_start_date_2i");
const start_date_3i = document.getElementById("booking_start_date_3i");
const end_date_1i = document.getElementById("booking_end_date_1i");
const end_date_2i = document.getElementById("booking_end_date_2i");
const end_date_3i = document.getElementById("booking_end_date_3i");
const total_price = document.getElementById("new_booking");

const total_price_completion = () => {
start_date_1i.addEventListener("click", () => {
  document.getElementById('price').innerHTML = '<%= (@booking.end_date - @booking.start_date).to_i %>';
});

start_date_2i.addEventListener("click", () => {
  document.getElementById('price').innerHTML = '<%= (@booking.end_date - @booking.start_date).to_i %>';
});

start_date_3i.addEventListener("click", () => {
  document.getElementById('price').innerHTML = ''
  document.getElementById('price').innerHTML = '<%= (@booking.end_date - @booking.start_date).to_i %>';
});

end_date_1i.addEventListener("click", () => {
  document.getElementById('price').innerHTML = '<%= (@booking.end_date - @booking.start_date).to_i %>';
});

end_date_2i.addEventListener("click", () => {
  document.getElementById('price').innerHTML = '<%= (@booking.end_date - @booking.start_date).to_i %>';
});

end_date_3i.addEventListener("click", () => {
  document.getElementById('price').innerHTML = '<%= (@booking.end_date - @booking.start_date).to_i %>';
});

};

export {total_price_completion}
