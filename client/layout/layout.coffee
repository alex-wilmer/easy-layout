toggleNav = ->
  Session.set 'navOpen', (->
    !Session.get 'navOpen'
  )()

  if Session.get 'navOpen'
    height = $('.header').height() + $('.footer').height()
    $('.left-aside')[0].style.height = 'calc(100% - ' + height + 'px)' 
  else 
    $('.left-aside')[0].style.height = 0

  $('.nav-icon').html (->
    if Session.get 'navOpen' then '←' else '<i class="fa fa-navicon"></i>'
  )()

Meteor.startup ->
  Session.set 'navOpen', window.innerWidth > 600
  if !Session.get 'navOpen'
    $('.left-aside')[0].style.height = $('.left-aside')[0].style.opacity = 0
    setTimeout ->
      $('.left-aside')[0].style.opacity = 1
    , 1000 

  window.onresize = ->
    if ((window.innerWidth < 600 && Session.get 'navOpen') ||
        (window.innerWidth > 600 && !Session.get 'navOpen'))
      toggleNav()     

Template.body.events
  'click .nav-icon': (e) ->
      toggleNav()

Template.leftAside.helpers
  navClass: ->
    if Session.get 'navOpen' then 'active' else 'inactive'
