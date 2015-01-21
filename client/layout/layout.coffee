Meteor.startup ->
  small = window.innerWidth < 600

  window.onresize = ->
    if (window.innerWidth < 600 && !small)
      console.log 'below'
      small = true
      $ '.left-aside'
        .addClass 'inactive' 
        .hide() 
      Session.set 'nav', 'closed'
      setTimeout ->
        $ '.left-aside'
          .removeClass('active')
      , 0
      $ '.nav-icon'        
        .html '☰' 

    else if (window.innerWidth > 600 && small)
      console.log 'above'
      small = false
      $ '.left-aside'
        .addClass 'active'       
      setTimeout ->
        $ '.left-aside'
          .removeClass 'inactive'
          .show()
      , 0     

Template.body.events
  'click .nav-icon': (e) ->
    if Session.get('nav') == 'closed' || Session.get('nav') == undefined
      $ '.left-aside'
        .addClass 'active'
        .removeClass 'inactive'
        .show()        
      Session.set 'nav', 'open'
      $ '.nav-icon'
        .html '←'
    else
      $ '.left-aside'
        .addClass 'inactive'  
      setTimeout ->
        $ '.left-aside'
          .removeClass 'active'
          .hide()
      , 500
      Session.set 'nav', 'closed'
      $ '.nav-icon'        
        .html '☰'                 