toggleNav = ->
  if Session.get 'navOpen'
    $('.nav-icon').html '<i class="fa fa-navicon"></i>' 
  else 
    $('.nav-icon').html '←' 

  Session.set 'navOpen', !Session.get 'navOpen'

Meteor.startup ->
  Session.set 'navOpen', window.innerWidth > 600
  if !Session.get 'navOpen'
    $('.left-aside')[0].style.opacity = 0
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
