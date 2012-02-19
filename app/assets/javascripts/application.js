// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){

$("#showCompletedTasks a").click(function(){
$("#showCompletedTasks").hide();
$("#completedTasks").show(500);
}
);

$("#hideCompleted").click(function(){
  $("#showCompletedTasks").show(500);
  $("#completedTasks").hide();
});


$("#addListP").click(function(){
  $("#newList").show();
});

$(".b-paranja").click(function(){
$(".b-paranja").css("display","none");
});

$(".b-dropdown-handle").click(function(){
  var t = $(this).parent().prev();

  if(!t.prop("checked"))
  {
    t.click();
    $(".b-paranja").css("display","block");
  }
});

$('#addButton a').click(function(){
  $(this).parent().prev().show(500);
});

})

function hide(id)
{
   document.getElementById(id).style.display = "none";
}





