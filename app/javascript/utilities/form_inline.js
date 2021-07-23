import { FormInline } from './FormInline.js'

 document.addEventListener('turbolinks:load', function () {
   const testRowsList = document.querySelectorAll(".test-inline-edit")

   testRowsList.forEach(rowTest => {
     new FormInline(rowTest)
   })
 })