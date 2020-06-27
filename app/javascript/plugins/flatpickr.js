import flatpickr from "flatpickr";


const calendrier = () => {
  const dateInput = document.querySelector(".flatpickr").flatpickr({
    mode: 'range',
  });
};

flatpickr(".datepicker", {});
