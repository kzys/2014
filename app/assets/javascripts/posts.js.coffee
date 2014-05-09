# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

MenuWidth = 160

toggleLeftMenu = () ->
  header = document.getElementsByTagName('header')[0]
  main = document.getElementsByTagName('main')[0]

  if main.offsetLeft == 0
    header.style.left = MenuWidth + 'px'
    main.style.marginLeft = MenuWidth + 'px'
  else
    header.style.left = '0px'
    main.style.marginLeft = '0px'

initialize = () ->
  hamburger = document.getElementById('hamburger')
  return unless hamburger
  hamburger.addEventListener('click', (event) ->
    event.preventDefault()
    toggleLeftMenu()
  )

document.addEventListener('page:change', initialize)
