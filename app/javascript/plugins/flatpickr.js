import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
  inline: true,
  enableTime: true,
  defaultDate:"2016-10-20 15:30",
  minDate: "2016-10-20 15:30",
  maxDate: "2016-10-20 15:30",
  minTime: "15:30",
  maxTime: "15:30"
})
