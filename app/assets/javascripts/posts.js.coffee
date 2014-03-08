# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initialize = () ->
  document.getElementById('hamburger').addEventListener('click', () ->
    main = document.getElementsByTagName('main')[0]
    main.style.transition = 'margin-left 0.2s ease 0s'
    if main.offsetLeft == 0
      main.style.marginLeft = '200px'
    else
      main.style.marginLeft = '0px'
  )

document.addEventListener('DOMContentLoaded', initialize)
