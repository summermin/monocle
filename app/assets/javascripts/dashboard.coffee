# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  if $('.front-page-call-to-action').length > 0
    goalTexts = ["run a marathon", "lose 20 pounds", "stop smoking"]
    timeTexts = ["August 30th", "September 15th", "December 31st"]
    moneyTexts = ["$50", "$100", "$200"]
    charityTexts = ["the American Red Cross", "St. Jude Children's", "Doctors without Borders"]

    showGoal = () ->
      console.log('showing goal')
      console.log(index)
      console.log(goalTexts[index])

      $('span.highlighted.goal-text .value').fadeOut(1000, ->
        $('span.highlighted.goal-text .value').text(goalTexts[index])
        $('span.highlighted.goal-text .value').fadeIn(2000)
      )

      $('span.highlighted.time-period-text .value').fadeOut(1000, ->
        $('span.highlighted.time-period-text .value').text(timeTexts[index])
        $('span.highlighted.time-period-text .value').fadeIn(2000)
      )

      $('span.highlighted.monetary-amount-text .value').fadeOut(1000, ->
        $('span.highlighted.monetary-amount-text .value').text(moneyTexts[index])
        $('span.highlighted.monetary-amount-text .value').fadeIn(2000)
      )
 
      $('span.highlighted.charity-name-text .value').fadeOut(1000, ->
        $('span.highlighted.charity-name-text .value').text(charityTexts[index])
        $('span.highlighted.charity-name-text .value').fadeIn(2000)
      )

    index = 0

    nextGoal = () ->
      showGoal()
      index = (index + 1) % goalTexts.length

    showGoal();

    window.setInterval(nextGoal, 7500);