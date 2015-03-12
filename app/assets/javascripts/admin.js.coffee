# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

loggedIn = false

login = (text) ->

	params =
		pass: text

	$.post "/admin/auth", params, (data) ->
		loggedIn = data.valid
		if loggedIn
			$("#login").addClass("hidden")
			$("#panel").removeClass("hidden")

$(document).ready () ->

	$(document).keypress (e) ->
		if not loggedIn and e.which == 13 
			login($("#pass").val())

	$("#add").click () ->

		$option = $("<div class='input-group' />")
		$btn = $("<span class='input-group-btn'><div class='btn btn-danger'><span class='glyphicon glyphicon-minus'></span></div></span>")
		$btn.click () ->
			$option.remove()

		$input = $("<input class='form-control' type='text' placeholder='Alternativ..' />")

		$input.appendTo $option
		$btn.appendTo $option

		$option.appendTo $("#options")

	$("#begin").click () ->
		options = $("#options div input").map () -> $(this).val()
			.get()
			
		console.log options
