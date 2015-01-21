toggleNav = ->
  Session.set 'navOpen', (->
    !Session.get 'navOpen'
  )()

  $('.nav-icon').html (->
    if Session.get 'navOpen' then '←' else '☰'
  )()

Meteor.startup ->
  Session.set 'navOpen', window.innerWidth > 600     

  window.onresize = ->
    if (window.innerWidth < 600 && Session.get 'navOpen') 
      toggleNav()

    else if (window.innerWidth > 600 && !Session.get 'navOpen')
      toggleNav()   

Template.body.events
  'click .nav-icon': (e) ->
      toggleNav()

Template.leftAside.helpers
  navClass: ->
    if Session.get 'navOpen' then 'active' else 'inactive'
