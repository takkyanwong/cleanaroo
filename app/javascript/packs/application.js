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
import "../plugins/flatpickr";



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { numberDown, numberUp } from '../components/button';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initStarRating } from '../plugins/init_star_rating';

// JS to +/- number of Bedrooms
document.addEventListener('turbolinks:load', () => {
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

// Star rating
document.addEventListener('turbolinks:load', () => {
  initStarRating();
  if (window.location.href.indexOf('review') > 0) {
    $('#pills-profile-tab').tab('show');
  }
});

// Navbar Side Menu Behaviour
document.addEventListener('turbolinks:load', () => {
	const sidebarBox = document.querySelector('.side__menu')
	const	sidebarBtn = document.querySelector('.burger__btn')
	const pageWrapper = document.querySelector('#page-wrapper');

	sidebarBtn.addEventListener('click', event => {
			sidebarBtn.classList.toggle('active');
			sidebarBox.classList.toggle('active');
			if (sidebarBox.classList.contains('active')) {
				pageWrapper.style.display = 'block';
			} else {
				pageWrapper.style.display = 'none';
			}
	});

	pageWrapper.addEventListener('click', event => {
			if (sidebarBox.classList.contains('active')) {
					sidebarBtn.classList.remove('active');
					sidebarBox.classList.remove('active');
					event.target.style.display = 'none';
			}
	});

	window.addEventListener('keydown', event => {

			if (sidebarBox.classList.contains('active') && event.keyCode === 27) {
					sidebarBtn.classList.remove('active');
					sidebarBox.classList.remove('active');
					pageWrapper.style.display = 'none';
			}
	});
});

// MAP
import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})

document.addEventListener('turbolinks:load', () => {
	const phoneInput = document.getElementById('user_phone_number');
	const emailInput = document.getElementById('user_email');
	const phoneRegex = /^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$/
	phoneInput.addEventListener('input', event => {
	console.log(phoneRegex.test(event.target.value));
	if (phoneRegex.test{})

	})
	});
})
