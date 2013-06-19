# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#circuit_origin_city').autocomplete
		source: $('#circuit_origin_city').data('autocomplete-source')

	$('#circuit_destination_city').autocomplete
		source: $('#circuit_destination_city').data('autocomplete-source')
