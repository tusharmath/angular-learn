#TimeVarianceService
(->
	###
		Breaks down the difference in time and returns the result
	###
	class _TimeVarianceService
		constructor: -> @reset()
		getVariance: ->
			dateDiff = new Date  new Date - @_time

			milliseconds: dateDiff.getUTCMilliseconds()
			seconds : dateDiff.getUTCSeconds()
			minutes : dateDiff.getUTCMinutes()
			hours : dateDiff.getUTCHours()

		reset: ->
			@_time = new Date

	angular.module('myAppModule').service 'TimeVarianceService', _TimeVarianceService
)()
