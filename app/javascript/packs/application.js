/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'bootstrap';

console.log('Hello World from Webpacker')

document.getElementById('mix').addEventListener('click', (e) => {
  addOrHide(e.target);
  e.target.classList.toggle('btn-primary');
  e.target.classList.toggle('btn-info');
  var form = document.getElementById('dose-form');
  form.classList.toggle('hidden-height');
  form.classList.toggle('height-line-tall')
});

function addOrHide(target) {
  if (/add/i.test(target.innerHTML)) {
    target.innerHTML = 'Hide';
  } else {
    target.innerHTML = 'Add';
  }
}
