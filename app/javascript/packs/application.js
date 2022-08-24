// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You"re encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it"ll be compiled.
//= require jquery
//= require jquery_ujs

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
require('admin-lte');
require("bootstrap");
require("jquery");
require("cocoon");
import "admin-lte/dist/css/AdminLTE.css";
import "font-awesome/css/font-awesome.css";
require('../stylesheets/application');
import "@fortawesome/fontawesome-free/js/all";
require("./product")

global.toastr = require("toastr")
document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()

