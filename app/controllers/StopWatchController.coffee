#SimpleController File
((myApp) ->
	###
		Should contain only View Logic
		One controller for one view
	###
	class _StopWatchController
		constructor:(@scope, @stopWatch) ->

				@hours = 0
				@minutes = 0
				@seconds = 0
				@milliseconds = 0

				@laps = []

		start : ->

			self = @
			callback = (data)->

				_.assign self, _.pick data, 'milliseconds', 'hours', 'minutes', 'seconds'


			@stopWatch.start callback

		reset : ->
			@stopWatch.reset()
			@laps= []


		stop: ->
			@stopWatch.pause()

		lap: ->
			@laps.push _.pick @stopWatch, 'hours', 'seconds', 'minutes', 'milliseconds'


	_StopWatchController.$inject = ['$scope','StopWatchService']

	myApp.controller 'StopWatchController', _StopWatchController
)(myApp)
