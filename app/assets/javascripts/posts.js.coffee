# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

MenuWidth = 160

initialize = () ->
  document.getElementById('hamburger').addEventListener('click', () ->
    container = document.getElementById('container')
    header = document.getElementsByTagName('header')[0]
    main = document.getElementsByTagName('main')[0]

    if main.offsetLeft == 0
      header.style.left = MenuWidth + 'px'
      main.style.width = main.offsetWidth + 'px'
      main.style.marginLeft = MenuWidth + 'px'
      container.style.width = main.offsetWidth + 'px'
      container.style.height = main.offsetHeight + 'px'
    else
      header.style.left = '0px'
      main.style.marginLeft = '0px'
  )

document.addEventListener('DOMContentLoaded', initialize)
