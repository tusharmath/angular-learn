#Clock Digit Filter
((myApp) ->
	myApp.filter 'ClockDigitFilter', ->
		(input) ->
			if input < 10 then  "0#{input}" else input
)(myApp)

