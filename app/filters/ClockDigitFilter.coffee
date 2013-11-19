#Clock Digit Filter
(->
	angular.module('myAppModule').filter 'ClockDigitFilter', ->
		(input, type) ->

            if type is 'milliseconds'
                if input < 10
                    return "00#{input}"
                else if input < 100
                    "0#{input}"
                else input
            else
                if input < 10 then  "0#{input}" else input
)()

