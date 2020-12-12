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

const validateFormFields = (phoneInput, emailInput, phoneRegex, emailRegex, passwordConfirmation, passwordInput) => {
	phoneInput.addEventListener('input', (event) => {
		if (phoneRegex.test(event.target.value) || phoneInput.value.length == 0 ) {
			document.getElementById('phone-error-message').style.display = 'none';
		} else {
			document.getElementById('phone-error-message').style.display = 'block';
		}
	});
	emailInput.addEventListener('input', (event) => {
		if (emailRegex.test(event.target.value) || emailInput.value.length == 0 ) {
			document.getElementById('email-error-message').style.display = 'none';
		} else {
			document.getElementById('email-error-message').style.display = 'block';
		}
	});
	passwordConfirmation.addEventListener('input', (event) => {
		if (passwordInput.value === event.target.value ) {
			document.getElementById('password-confirmation-error').style.display = 'none';
		} else {
			document.getElementById('password-confirmation-error').style.display = 'block';
	}
});
};

document.addEventListener('turbolinks:load', () => {
	if (document.getElementById('sign-up-button')) {
		const phoneInput = document.getElementById('user_phone_number');
		const emailInput = document.getElementById('user_email');
		const passwordInput = document.getElementById('user_password');
		const nameInput = document.getElementById('user_name');
		const signUpForm = document.getElementById('new_user');
		const passwordConfirmation = document.getElementById('user_password_confirmation');
		const phoneRegex = /^(?=(?:\+|0{2})?(?:(?:[\(\-\)\.\/ \t\f]*\d){7,10})?(?:[\-\.\/ \t\f]?\d{2,3})(?:[\-\s]?[ext]{1,3}[\-\.\/ \t\f]?\d{1,4})?$)((?:\+|0{2})\d{0,3})?(?:[\-\.\/ \t\f]?)(\(0\d[ ]?\d{0,4}\)|\(\d{0,4}\)|\d{0,4})(?:[\-\.\/ \t\f]{0,2}\d){3,8}(?:[\-\s]?(?:x|ext)[\-\t\f ]?(\d{1,4}))?$/;
		const emailRegex = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

		validateFormFields(phoneInput, emailInput, phoneRegex, emailRegex, passwordConfirmation, passwordInput);
		signUpForm.addEventListener('input', () => {
			validateSignUp(phoneRegex, emailInput, passwordInput, passwordConfirmation, nameInput, emailRegex, phoneInput);
		});
	}
});

const validateSignUp = (phoneRegex, emailInput, passwordInput, passwordConfirmation, nameInput, emailRegex, phoneInput) => {
	let signUpValid = phoneRegex.test(phoneInput.value) && emailRegex.test(emailInput.value) && passwordInput.value.length > 0 && nameInput.value.length > 0 && passwordInput.value === passwordConfirmation.value;
	if (signUpValid) { document.getElementById('sign-up-button').disabled = false; }
};
