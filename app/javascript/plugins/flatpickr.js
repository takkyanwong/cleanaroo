import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  disableMobile: "true",
  inline: "true",
  enableTime: "true",
  minTime: "8:00",
  maxTime: "19:00",
  minDate: "today",
  defaultDate: Date.now()
});

