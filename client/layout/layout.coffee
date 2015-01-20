Meteor.startup ->
  small = window.innerWidth < 480

  window.onresize = ->
    if (window.innerWidth < 480 && !small)
      console.log 'below'
      small = true
      # setTimeout (->
      #   $('.left-aside').hide()
      # ), 500

    else if (window.innerWidth > 500 && small)
      console.log 'above'
      small = false