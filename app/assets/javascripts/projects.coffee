$(document).ready ->
  if $('.section.new-project').length > 0
    stepsTop = $('.section.new-project .steps-header').offset().top

    $(window).scroll ->
      currentScroll = $(window).scrollTop()

      if currentScroll >= stepsTop
        $('.section.new-project .steps-header').addClass 'sticky'
      else
        $('.section.new-project .steps-header').removeClass 'sticky'
      return