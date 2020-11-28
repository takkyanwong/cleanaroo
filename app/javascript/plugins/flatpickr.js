import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  disableMobile: "true",
  inline: "true",
  enableTime: "true",
  minTime: "08:00",
  maxTime: "19:00"
});