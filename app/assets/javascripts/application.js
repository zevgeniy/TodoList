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

$(".b-dropdown-handle").click(function(){
  var t = $(this).parent().prev();

  if(!t.prop("checked"))
  {
    t.click();
    $(this).text("-");
  }
  else
  {
    $("#Paranja").click();
    $(this).text("+");
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

function show(id)
{
   document.getElementById(id).style.display = "block";
}

function ShowAndHide(firstId, secondId)
{
	document.getElementById(firstId).style.display = "block";
	document.getElementById(secondId).style.display = "none";
}

function showEditBox(id)
{
	document.getElementById("formProj" + id).style.display = "block";
	document.getElementById("project" + id).style.display = "none";
}

function hideEditBox(id)
{
	document.getElementById("formProj" + id).style.display = "none";
	document.getElementById("project" + id).style.display = "block";
}



