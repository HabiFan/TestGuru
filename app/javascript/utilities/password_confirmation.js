import { PasswordConfirmation } from './PasswordConfirmation.js'

document.addEventListener('turbolinks:load', function () {
  const reg_form = document.getElementById('new_user_reg_form')
  if (reg_form) new PasswordConfirmation(reg_form)
})