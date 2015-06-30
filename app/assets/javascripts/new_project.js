$(document).ready(function(){

  $("#has-check-ins").hide();
  $("#recurring-checks").hide();
  $("#one-time-checks").hide();
  $("#check-ins").hide();
  
  $("#one-time").click(function(){
    $("#recurring-checks").hide();
    $("#check-ins").hide();
    $("#has-check-ins").show(200);
  })

  $("#yes-checks").click(function(){
    $("#one-time-checks").show(200);
    $("#check-ins").show(200);
  })

  $("#no-checks").click(function(){
    $("#one-time-checks").hide(200);
    $("#check-ins").hide(200);
  })

  $("#recurring").click(function(){
    $("#has-check-ins").hide();
    $("#one-time-checks").hide();
    $("#recurring-checks").show(200);
    $("#check-ins").show(200);
  })

}) // document ready