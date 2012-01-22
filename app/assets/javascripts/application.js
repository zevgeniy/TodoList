// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
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