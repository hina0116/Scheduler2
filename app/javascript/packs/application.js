// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import jquery from "jquery"
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
window.$ = window.jQuery = jquery;
require("./calendar/event.js")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const lightMode = document.querySelector('.sun');
const darkMode = document.querySelector('.moon');

/*global localStorage*/
const currentTheme = localStorage.getItem('theme') ? localStorage.getItem('theme') : null;

lightMode.onclick = function(){
  document.documentElement.setAttribute('data-theme', 'dark');
  lightMode.style = "display: none";
  darkMode.style = "display: block";
  localStorage.setItem('theme', 'dark');
}

darkMode.onclick = function(){
  document.documentElement.setAttribute('data-theme', 'light');
  lightMode.style = "display: block";
  darkMode.style = "display: none";
  localStorage.setItem('theme', 'light');

}

if (currentTheme) {
    document.documentElement.setAttribute('data-theme', currentTheme);

    if (currentTheme === 'dark') {
        lightMode.style = "display: none";
      darkMode.style = "display: block";
    }
}