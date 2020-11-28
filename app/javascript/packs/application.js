// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "../plugins/flatpickr"
// import "flatpickr/dist/flatpickr.css"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { numberDown, numberUp } from '../components/button';
import { initAutocomplete } from '../plugins/init_autocomplete';

// JS to +/- number of Bedrooms
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
	const sidebarBox = document.querySelector('.side__menu'),
			sidebarBtn = document.querySelector('.burger__btn'),
			pageWrapper = document.querySelector('#page-wrapper');

	sidebarBtn.addEventListener('click', event => {
			sidebarBtn.classList.toggle('active');
			sidebarBox.classList.toggle('active');
			pageWrapper.style.display = 'block';
	});

	pageWrapper.addEventListener('click', event => {

			if (sidebarBox.classList.contains('active')) {
					sidebarBtn.classList.remove('active');
					sidebarBox.classList.remove('active');
					pageWrapper.style.display = 'none';
			}
	});

	window.addEventListener('keydown', event => {

			if (sidebarBox.classList.contains('active') && event.keyCode === 27) {
					sidebarBtn.classList.remove('active');
					sidebarBox.classList.remove('active');
					pageWrapper.style.display = 'none';
			}
	});
  numberDown("#numberDownBed", "#numberBedRooms");
  numberUp("#numberUpBed", "#numberBedRooms");
});

// JS to +/- number of Bathrooms
document.addEventListener('turbolinks:load', () => {
    numberDown("#numberDownBath", "#numberBathRooms");
    numberUp("#numberUpBath", "#numberBathRooms");
});

// JS to autocomplete the address
document.addEventListener('turbolinks:load', () => {
    initAutocomplete();
});
