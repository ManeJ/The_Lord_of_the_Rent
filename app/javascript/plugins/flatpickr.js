import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#booking_start_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#booking_end_date" })]
})



